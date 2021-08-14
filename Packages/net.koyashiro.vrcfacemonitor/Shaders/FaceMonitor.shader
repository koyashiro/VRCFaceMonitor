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
        [Space]
        // Desktop
        [IntRange] _TargetResolution0_X ("Target resolution0 X", Range(0, 9999)) = 1920
        [IntRange] _TargetResolution0_Y ("Target resolution0 Y", Range(0, 9999)) = 1006
        [Space]
        // Valve Index
        [IntRange] _TargetResolution1_X ("Target resolution1 X", Range(0, 9999)) = 2188
        [IntRange] _TargetResolution1_Y ("Target resolution1 Y", Range(0, 9999)) = 2432
        [Space]
        // Valve Index
        [IntRange] _TargetResolution2_X ("Target resolution2 X", Range(0, 9999)) = 2208
        [IntRange] _TargetResolution2_Y ("Target resolution2 Y", Range(0, 9999)) = 2452
        [Space]
        [IntRange] _TargetResolution3_X ("Target resolution3 X", Range(0, 9999)) = 0
        [IntRange] _TargetResolution3_Y ("Target resolution3 Y", Range(0, 9999)) = 0
        [Space]
        [IntRange] _TargetResolution4_X ("Target resolution4 X", Range(0, 9999)) = 0
        [IntRange] _TargetResolution4_Y ("Target resolution4 Y", Range(0, 9999)) = 0
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
                uint id : SV_VERTEXID;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Size;
            float _OffsetX;
            float _OffsetY;
            float _Z;
            float _W;
            float _Alpha;

            float _TargetResolution0_X, _TargetResolution0_Y;
            float _TargetResolution1_X, _TargetResolution1_Y;
            float _TargetResolution2_X, _TargetResolution2_Y;
            float _TargetResolution3_X, _TargetResolution3_Y;
            float _TargetResolution4_X, _TargetResolution4_Y;

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

                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col;

                if ((_TargetResolution0_X == _ScreenParams.x && _TargetResolution0_Y == _ScreenParams.y)
                    || (_TargetResolution1_X == _ScreenParams.x && _TargetResolution1_Y == _ScreenParams.y)
                    || (_TargetResolution2_X == _ScreenParams.x && _TargetResolution2_Y == _ScreenParams.y)
                    || (_TargetResolution3_X == _ScreenParams.x && _TargetResolution3_Y == _ScreenParams.y)
                    || (_TargetResolution4_X == _ScreenParams.x && _TargetResolution4_Y == _ScreenParams.y))
                {
                    col = tex2D(_MainTex, i.uv) * half4(1, 1, 1, _Alpha);
                }
                else
                {
                    discard;
                }

                return col;
            }
            ENDCG
        }
    }
}
