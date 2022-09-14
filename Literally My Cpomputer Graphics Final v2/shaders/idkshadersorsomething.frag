#version 120

uniform sampler2D sampler0;
//uniform vec2 textureSize;
//uniform vec2 imageSize;
uniform float time;
//varying vec2 textureCoord;
varying vec2 textureCoord;
varying vec2 imageCoord;
uniform vec2 imageSize;
uniform vec2 textureSize;

uniform float yScroll = 0;
uniform float xScroll = 0;
uniform float grid = 1;
uniform float green = 0;

vec2 i2t(vec2 v){
  return v*imageSize/textureSize;
}

void main () {
	vec2 np = imageCoord.xy;//i2t(imageCoord.xy);//normal position
//	np.y = np.y+yScroll;
	vec2 gd = vec2(np.x*grid, np.y*grid);//idk, in case you want to change how much grid is in your grid
	gd = vec2(gd.x+(fract(grid/2)+0.5),gd.y+(fract(grid/2)+0.5));//center on screen
	vec2 gdd = fract(gd);
	gd = vec2(gd.x+xScroll,gd.y+yScroll);
	//lmao imagine if I was good at writing shaders
	//gdd.y = (floor(fract(gd.x/2.)*2.)*(gdd.y)) + ((1.-(floor(fract(gd.x/2.)*2.)))*(1-gdd.y));//uhhhh
	//gdd.x = (floor(fract(gd.x/2.)*2.)*(gdd.x)) + ((1.-(floor(fract(gd.x/2.)*2.)))*(1-gdd.x));//uhhhh
	vec2 fg1 = fract(vec2(gdd.x+xScroll,gdd.y+yScroll));//arbitrary scroll speed or whatever
	vec2 fg = i2t(fg1);//:catjam:
	vec3 col = texture2D(sampler0, fg).rgb;//arrows or something idk what you're passing in here

//chroma.frag.objection.mp4.green

	vec3 mgnt = vec3(0., 0., 0.5);
	vec3 gree = vec3(0., 1., 0.);
	vec3 targ = mgnt*(1.-green) + gree*(green);
	float dist = pow(distance(col, targ),10.);

	vec4 keyed = vec4(col, smoothstep(0., 0.0001, dist));

	//thanks AFTs for leaving a pixel wide line :))))))
	keyed *= vec4(1,1,1, (1-step(0.99,fg1.x))*(1-step(0.99,fg1.y)) );

	gl_FragColor = vec4(keyed);
}
