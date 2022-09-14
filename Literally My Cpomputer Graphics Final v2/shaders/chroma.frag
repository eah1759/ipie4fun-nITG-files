varying vec2 textureCoord;
varying vec4 color;

uniform float zPos;

uniform sampler2D sampler0;

void main() {
  vec3 col = texture2D( sampler0, textureCoord ).xyz;

  vec3 targ = vec3(1, 0, 1 );
  float dist = pow(distance(col, targ),10);

  vec4 keyed = vec4( col, smoothstep( 0.0, 0.1, dist) );

  gl_FragColor = vec4( keyed*color ) * 1;

}
