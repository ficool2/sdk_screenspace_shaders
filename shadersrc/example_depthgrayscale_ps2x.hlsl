\\ Grayscales pixels based on depth

#include "common.hlsl"

float4 main( PS_INPUT i ) : COLOR
{
	float4 tex = tex2D(TexBase, i.uv);
	float3 greyscale = float3(.5, .5, .5);
    float3 dotty = dot( float3(tex.r, tex.g, tex.b), greyscale );
	float iDepth = 1.0 - tex.w;
    float3 clr = float3(lerp(tex.r, dotty.r, iDepth), lerp(tex.g, dotty.g, iDepth), lerp(tex.b, dotty.b, iDepth));

	return float4( clr.r, clr.g, clr.b, tex.a );
}
