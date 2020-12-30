class Object extends Ball {

  Object(World w) {
    super(w);
  }

  void display() {
    if(alive){
      //make the object disappear after being catched
    fill(255, 0, 90, 150);
    noStroke();
    pushMatrix();
    translate (position.x, position.y, position.z);
    sphere(radius);
    popMatrix();
    }
  }
}
