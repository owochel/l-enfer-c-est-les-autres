/*Shuang Cai
 12/18/2019

 This is a processing project that traps a blue ball in a spinning 3D box. 
 The idea originated from "L'enfer c'est les autres" said by Jean-Paul Satre. 
 The blue ball had to challenge the space by engulfing its other-selves - red balls.
 
 Player will be controling the ball using w,a,s,d,q,e in a 3D box. 
 By pressing those keys, player ball will be added with an according velocity. 
 Press space will place the player back to the center.
 Press r will restart the game.
 
 
 */

World w;
float rotate = 0 ;
int state=0 ;

void setup() { 
  size(600, 600, P3D);
  w = new World();
  background(100);
  stroke(0, 100, 255);
  translate (100, 100, 100);

  w.balls[4] = new PlayerBall (w);//place the player ball to the last spot of the array

  for (int i = 0; i < 4; i++) {//place the object balls to the array
    w.addBall(new Object (w));
  }

  /*Ball test1= new Ball(w);
   Ball test2 = new Ball(w);
   println(test1.distance(test2));
   DEBUGGING
   */
}

void draw() {
  background(0);
  stroke(255);
  noFill();
  translate (width/2, height/2, width/2);

  if ( state ==0) {
    //starting page
    textSize(15);    
    text("Welcome to the BOX", -75, -30);
    text("Press r to begin", -55, 0);
    text("Press h for help", -55, 20);
    rotateY(rotate);
    rotateX(rotate);
    rotateZ(rotate);
    rotate=rotate+0.01;
    box(150, 150, 150);
  }

  if ( state==1) {
    //actual game
    rotateY(rotate);
    rotateX(rotate);
    rotateZ(rotate);
    rotate=rotate+0.01;
    box(150, 150, 150);
    w.tick();
  }

  if (state == 2) {
    String s = "Catch all the red objects. Press r to begin. There may be no exit in this world.";
    text(s, -115, -80, 200, 50);
    text("Control:", -115, -10);
    text("w↑ a← s↓ d→", -115, 10);
    text("q forward e backward", -115, 30);
    text("Space to start from center", -115, 50);
  }

  //the control of the playerball
  if (key == 'a') {
    w.balls[4].position.x=w.balls[4].position.x+3*w.balls[4].velocity.x;
  }
  if ( key == 'd') {
    w.balls[4].position.x=w.balls[4].position.x-3*w.balls[4].velocity.x;
    //println("hi");DEBUGGING
  } 
  if ( key == 'w') {
    w.balls[4].position.y=w.balls[4].position.y+3*w.balls[4].velocity.y;
  } 
  if ( key == 's') {
    w.balls[4].position.y=w.balls[4].position.y-3*w.balls[4].velocity.y;
  } 
  if ( key == 'q') {
    w.balls[4].position.z=w.balls[4].position.z-3*w.balls[4].velocity.z;
  }
  if ( key == 'e') {
    w.balls[4].position.z=w.balls[4].position.z+3*w.balls[4].velocity.z;
  }
  if (key ==' ') {
    //replace the player to the center
    w.balls[4].position.z=0;
    w.balls[4].position.y=0;
    w.balls[4].position.x=0;
  }
  if (key == 'r') {
    //restart the game
    state =1;
    w.balls[4].position.z=0;
    w.balls[4].position.y=0;
    w.balls[4].position.x=0;
    for (int i=0; i<5; i++) {
      w.balls[i].alive=true;
    }
  }
  //help page
  if (key == 'h') {
    state = 2;
  }
}
