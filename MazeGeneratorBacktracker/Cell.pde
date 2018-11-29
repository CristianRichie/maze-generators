class Cell {
  int x, y, sz;
  boolean visited = false, current = false;
  boolean[] walls = {true, true, true, true};
  int dir = -1;

  Cell(int x, int y, int sz) {
    this.x = x;
    this.y = y;
    this.sz = sz;
  }

  void show() { 
    if (visited)
      fill(240, 188, 92);
    if (current) 
      fill(92, 240, 135);
    if (!visited && !current) 
      fill(67, 199, 245);
    noStroke();
    rect(x, y, sz, sz);

    strokeWeight(1.5);
    stroke(51);
    if (walls[0])
      line(x, y, x + sz, y);
    if (walls[1])
      line(x + sz, y, x + sz, y + sz);
    if (walls[2])
      line(x + sz, y + sz, x, y + sz);
    if (walls[3])
      line(x, y + sz, x, y);
  }

  void removeWalls(int w) {
    walls[w] = false;
  }
}
