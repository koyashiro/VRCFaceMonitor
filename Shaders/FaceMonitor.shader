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
                fixed4 col = tex2D(_MainTex, i.uv);
                col.w *= _Alpha;
                return col;
            }
            ENDCG
        }
    }
}
