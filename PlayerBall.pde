class PlayerBall extends Ball {

  PlayerBall(World w) {
    super(w);
  }
  void display() {
    fill(0, 90, 255, 150);//different color
    noStroke();
    pushMatrix();
    translate (position.x, position.y, position.z);
    sphere(radius);
    popMatrix();

    if (this.w.nearBy(this, radius, Object.class)) {
      //catch the object!
      Ball b= this.w.nearBy(this);
      b.die();//DIE!!!
    }
  }
}
