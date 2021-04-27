class Platform {
  PVector pos;
  PImage plot;
  Platform( float x, float y) {
    pos = new PVector(x, y);
    plot = loadImage("platform.png");
  }
  void show() {
    image(plot, pos.x, pos.y, 150, 200);
  }
  boolean collide(PVector p) {
    if(p.x > pos.x && p.y > pos.y && p.x < pos.x+100 && p.y < pos.y+30) {
      return true;
    }
    return false;
  }
}
