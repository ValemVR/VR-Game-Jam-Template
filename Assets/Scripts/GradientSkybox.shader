Shader "Custom/GradientSkybox" {

    Properties {
        _Color2 ("Top Color", Color) = (0.97, 0.67, 0.51, 0)
        _Color1 ("Bottom Color", Color) = (0, 0.7, 0.74, 0)

        [Space]
        _Intensity ("Intensity", Range (0, 2)) = 1.0
        _Exponent ("Exponent", Range (0, 3)) = 1.0
        
        [HideInInspector]
        _Direction ("Direction", Vector) = (0, 1, 0, 0)
    }

    CGINCLUDE

    #include "UnityCG.cginc"

    struct appdata {
        float4 position : POSITION;
        float3 texcoord : TEXCOORD0;
    };
    
    struct v2f {
        float4 position : SV_POSITION;
        float3 texcoord : TEXCOORD0;
    };
    
    half4 _Color1;
    half4 _Color2;
    half3 _Direction;
    half _Intensity;
    half _Exponent;
    
    v2f vert (appdata v) {
        v2f o;
        o.position = UnityObjectToClipPos(v.position);
        o.texcoord = v.texcoord;
        return o;
    }
    
    fixed4 frag (v2f i) : COLOR {
        half d = dot(normalize(i.texcoord), _Direction) * 0.5f + 0.5f;
        return lerp (_Color1, _Color2, pow(d, _Exponent)) * _Intensity;
    }

    ENDCG

    SubShader {
        Tags { "RenderType"="Background" "Queue"="Background" }

        Pass {
            ZClip False
            ZWrite Off
            Cull Off
            Fog { Mode Off }
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma vertex vert
            #pragma fragment frag
            ENDCG
        }
    }
}
