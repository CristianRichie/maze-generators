class Wall {
  int x, y, sz;
  int horv;
  boolean show = true, current = false;

  Wall(int x, int y, int sz, int horv) {
    this.x = x;
    this.y = y;
    this.sz = sz;
    this.horv = horv;
  }

  void show() {
    if (current)
      stroke(92, 240, 135);
    else
      stroke(51);
    strokeWeight(1.5);
    if (show) {
      if (horv == 0)
        line(x, y, x + sz, y);
      else
        line(x, y, x, y + sz);
    }
  }
}
