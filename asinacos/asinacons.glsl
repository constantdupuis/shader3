#version 300 es

#define M_PI 3.1415926535897932384626433832795
#define M_HALF_PI M_PI/2.
#define M_2PI M_PI*2.

precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

out vec4 outColor;

void main(){
	vec2 st = gl_FragCoord.xy/u_resolution.xy;
	st.x *= u_resolution.x/u_resolution.y;
  st *= 2.0;
  st -= 1.0;

  vec2 dir = normalize( vec2(0.,0.) - st);
  float a = acos(dir.x) / M_PI;

  //a = sin(a);

  outColor = vec4( vec3(a), 1.);
}