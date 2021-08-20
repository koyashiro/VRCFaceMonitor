Shader "KoyashiroKohaku/FaceMonitor"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _Size ("Size", Range(0, 5)) = 5
        _OffsetX ("Offset X", Range(-10, 10)) = 0
        _OffsetY ("Offset Y", Range(-10, 10)) = 0
        [HideInInspector] _Z ("Z", Range(-100, 100)) = -10
        [HideInInspector] _W ("W", Range(-100, 100)) = 4
        _Alpha ("Alpha", Range(0, 1)) = 1
    }

    SubShader
    {
        Tags { "Queue"="Overlay" "RenderType"="Transparent" }
        LOD 100
        Cull Off
        Blend SrcAlpha OneMinusSrcAlpha
        Lighting Off
        ZTest always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            //#pragma target 2.0
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Size;
            float _OffsetX;
            float _OffsetY;
            float _Z;
            float _W;
            float _Alpha;

            float2 _TargetResolution0, _TargetResolution1, _TargetResolution2, _TargetResolution3;

            bool isTarget()
            {
                const float RAD_2_REG = 180 / UNITY_PI;
                float fov = round(atan(1.0f / unity_CameraProjection._m11) * 2.0 * RAD_2_REG);

                return
                    // Desktop (ignore screenshot)
                    (fov == 60 && !(_ScreenParams.x == 1920 && _ScreenParams.y == 1080) && !(_ScreenParams.x == 4096 && _ScreenParams.y == 2160))
                    // VR
                    || fov > 90;
            }

            bool inRange(float3 worldPos)
            {
                const float RANGE = 0.5;

#if defined(USING_STEREO_MATRICES)
                float3 cameraPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) / 2;
#else
                float3 cameraPos = _WorldSpaceCameraPos;
#endif

                float dist = distance(worldPos, cameraPos);
                return dist < RANGE;
            }

            v2f vert (appdata v)
            {
                v2f o;
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                fixed4 vertex;
                vertex.x = (2 * o.uv.x - 1) * _Size + _OffsetX;
                vertex.y = (2 * o.uv.y - 1) * _Size + _OffsetY;
                vertex.z = _Z;
                vertex.w = _W;

                o.vertex = mul(UNITY_MATRIX_P, vertex);
                o.worldPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;

                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv) * half4(1, 1, 1, _Alpha);

                if (!isTarget() || !inRange(i.worldPos))
                {
                    discard;
                }

                return col;
            }

            ENDCG
        }
    }
}
