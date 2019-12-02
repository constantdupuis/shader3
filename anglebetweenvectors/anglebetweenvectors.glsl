#version 300 es

#define M_PI 3.1415926535897932384626433832795
#define M_HALF_PI M_PI/2.
#define M_2PI M_PI*2.

precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 ref = vec2(-1., 0.);

out vec4 outColor;

void main(){
	vec2 st = gl_FragCoord.xy/u_resolution.xy;
	st.x *= u_resolution.x/u_resolution.y;
  st *= 2.0;
  st -= 1.0;

  float a = acos( dot(st, ref) / (length(st) * length(ref)) );
    a /= M_2PI;
  //a = sin(u_time+a*20.);
  outColor = vec4( vec3(a), 1.);
}