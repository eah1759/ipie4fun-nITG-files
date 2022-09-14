#version 120
#extension GL_OES_standard_derivatives : enable

//precision highp float;

uniform float time;
uniform vec2 resolution;

varying vec2 imageCoord;
uniform vec2 imageSize;
uniform vec2 textureSize;

uniform float per = 0.;

#define RATE 0.75

uniform sampler2D imageData;
// ---------------------------------------------------------------------------------------------------------------------

vec2 i2t(vec2 v){
  return v*imageSize/textureSize;
}

//Credit where credit is due:
//Original shader created by jojjesv
//https://www.shadertoy.com/view/MlVSD3

float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453) * 2.0 - 1.0;
}

float offset(float blocks, vec2 uv) {
  float shaderTime = time*RATE;
  return rand(vec2(shaderTime, floor(uv.y * blocks)));
}

void main() {
  vec2 uv = i2t(imageCoord.xy);//normal position

  gl_FragColor = texture2D(imageData, uv);
  gl_FragColor.r = texture2D(imageData, uv + per * vec2(offset(64.0, uv) * 0.03, 0.0)).r;
  gl_FragColor.g = texture2D(imageData, uv + per * vec2(offset(64.0, uv) * 0.03 * 0.16666666, 0.0)).g;
  gl_FragColor.b = texture2D(imageData, uv + per * vec2(offset(64.0, uv) * 0.03, 0.0)).b;/**/
}
