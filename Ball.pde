class Ball {
  //parent class of Object and PlayerBall
  PVector position, velocity;
  float radius = 10;
  boolean alive = true;
  
  World w;

  Ball (World w) {
 
    this.position = new PVector(0, 0, 0);
    this.velocity = new PVector(random(5.0), random(5.0), random(5.0));
    this.w=w;
  }


  void bounce() {
    //limit the balls in side of the box
    if (abs(position.x)+radius > 75) {
      velocity.x=-velocity.x;
    }
    if (abs(position.y)+radius> 75) {
      velocity.y=-velocity.y;
    }
    if (abs(position.z)+radius> 75) {
      velocity.z=-velocity.z;
    }
  }



  void move() {
    position.x=position.x+velocity.x;
    position.z=position.z+velocity.z;
    position.y=position.y+velocity.y;
  }
  
  void display() {
      lights();
      noStroke();
      pushMatrix();
      translate (position.x, position.y, position.z);
      sphere(radius);
      
      popMatrix();
      println("hi");
  }
  
  void die(){
    alive = false;
  }

  float distance(Ball b) {
    return sqrt(sq(position.x-b.position.x)+sq(position.y-b.position.y)+sq(position.z-b.position.z));
  }
}
