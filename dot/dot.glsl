#version 300 es

#define M_PI 3.1415926535897932384626433832795
#define M_2PI M_PI*2.


precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

out vec4 outColor;

vec2 ligth, ligth2, ligth3;
float t;

void main(){
	vec2 st = gl_FragCoord.xy/u_resolution.xy;
	st.x *= u_resolution.x/u_resolution.y;
  st *= 2.0;
  st -= 1.0;

  t= u_time*4.;

  ligth = vec2( sin(t), cos(t));
  ligth2 = vec2(sin(t+M_2PI*1./3.), cos(t+M_2PI*1./3.));
  ligth3 = vec2(sin(t+M_2PI*2./3.), cos(t+M_2PI*2./3.));

  float dt = dot( normalize(st), ligth);
  dt += 1.;
  dt /= 2.;


  float dt2 = dot( normalize(st), ligth2);
  dt2 += 1.;
  dt2 /= 2.;

  float dt3 = dot( normalize(st), ligth3);
  dt3 += 1.;
  dt3 /= 2.;

  outColor = vec4(dt, dt2, dt3, 1.);
}