ArrayList<Cell> cells = new ArrayList<Cell>();
ArrayList<Cell> stack = new ArrayList<Cell>();

int k = 20;
int sz = 400;

Cell current;

void setup() {
  size(450, 450);

  for (int i = 0; i < sz; i += (sz / k)) {
    for (int j = 0; j < sz; j += (sz / k)) {
      cells.add(new Cell(i, j, sz / k));
    }
  }

  current = cells.get(0);
  current.visited = true;
  current.current = true;
}

ArrayList<Cell> getNeighbors(int x, int y) {
  ArrayList<Cell> res = new ArrayList<Cell>();

  int[] dirs = {0, 1, 2, 3};
  int[] movs = {0, -1, 1, 0, 0, 1, -1, 0};

  for (int i = 0; i < movs.length; i += 2) {
    int nx = x + movs[i];
    int ny = y + movs[i + 1];

    if ((nx >= 0 && nx < k) && (ny >= 0 && ny < k) && (cells.get(nx * k + ny).visited == false)) {
      res.add(cells.get(nx * k + ny));
      cells.get(nx * k + ny).dir = dirs[i / 2];
    }
  }
  return res;
}

void draw() {
  translate(25, 25);
  background(40);

  for (Cell c : cells) {
    c.show();
  }

  // ALGORITHM
  ArrayList<Cell> neigh = getNeighbors(current.x / (sz / k), current.y / (sz / k));
  if (neigh.size() > 0) {

    int rnd_choice = (int) random(0, neigh.size());
    current.current = false;
    stack.add(current);

    current.removeWalls(neigh.get(rnd_choice).dir);
    neigh.get(rnd_choice).removeWalls((neigh.get(rnd_choice).dir + 2) % 4);

    current = neigh.get(rnd_choice);
    current.visited = true;
    current.current = true;
  } else if (stack.size() > 0) {

    current.current = false;
    current = stack.get(stack.size() - 1);
    current.current = true;
    stack.remove(stack.size() - 1);
  }
}
