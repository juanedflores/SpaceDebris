class Debris {
  PShape s;
  int x, y;
  float rotX, rotY;
  float dirX, dirY;
  
  Debris(PShape _s, int _x, int _y) {
    x = _x;
    y = _y;
    s = _s;
    rotX = random(0, 0.01);
    rotY = random(0, 0.01);
    dirX = random(0, 0.01);
    dirY = random(0, 0.01);
    s.scale(5);
  }
  
  void show() {
    pushMatrix();
    translate(dirX, dirY, 50);   
    rotateY(rotX);
    rotateX(rotY);
    shape(s, 0, 0);
    popMatrix();

    rotX+=0.05;
    rotY+=0.05;
    dirX+=0.1;
    dirY+=0.1;
  }

}
