class Debris {
  PShape s;
  float x, y;
  float rotX, rotY;
  float vDX, vDY, vRX, vRY;
  float dirX, dirY;
  
  Debris(PShape _s, int _x, int _y) {
    s = _s;
    // Starting location and rotation angle.
    x = _x;
    y = _y;
    dirX = 0;
    dirY = 0;
    rotX = 0;
    rotY = 0;
    // Random direction and rotation velocity.
    vDX = random(-0.8, 0.8);
    vDY = random(-0.8, 0.8);
    vRX = random(-0.01, 0.01);
    vRY = random(-0.01, 0.01);
    // Scale.
    s.scale(5);
  }
  
  void show() {
    pushMatrix();
    translate(x, y, 50);   
    rotateY(rotX);
    rotateX(rotY);
    shape(s, 0, 0);
    popMatrix();

    // Update direction and rotation.
    x+=vDX;
    y+=vDY;
    rotX+=vRX;
    rotY+=vRY;

    checkBounds();
  }

  void checkBounds() {
    if (x > boundaryW/2) {
      x = -boundaryW/2;
    }
    if (x < -boundaryW/2) {
      x = boundaryW/2;
    }
    if (y > boundaryH/2) {
      y = -boundaryH/2;
    }
    if ( y < -boundaryH/2) {
      y = boundaryH/2;
    }
  }
}
