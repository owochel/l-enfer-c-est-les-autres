class World {
  private Ball[] balls;
  private int num = 0;
  private final int MAX_BALLS = 5;

  World() {
    balls = new Ball[MAX_BALLS];
  }

  void addBall(Ball b) {
    if (num<=MAX_BALLS) {
      balls[num] = b;
      num++;
    }
  }

  void tick() {
    //where everything actually happened
    fill(255);
    if ( balls[0]!= null) {
      //println(balls[3] == null);DEBUGGING
      for (int i = 0; i <= num; i++) {
        //println(num);DEBUGGING
        balls[i].move();
        balls[i].display();
        balls[i].bounce();
      }
    }
  }

  boolean nearBy(Ball c, float maxD, Class T) {
    //the boolean to check if the player sucessfully catched the object
    for (int i =0; i <4; i++) {
      float d = c.distance(balls[i]);
      if (d<maxD && T.isInstance(balls[i])) {
        return true;
      }
    }
    return false;
  }


  Ball nearBy(Ball c) {
    //application of the boolean nearBy
    //println(1);DEBUGGING
    if (num < 0) return null;
    Ball closest = balls[0];
    float minDist = c.distance(balls[0]);
    for (int i = 0; i < num; i++) {
      float d = c.distance(balls[i]);
      if (c != balls[i] && d < minDist) {
        minDist = d;
        closest = balls[i];
        //println(0);DEBUGGING
      }
    }
    return closest;
  }
}
