import java.util.Collections;

ArrayList<Wall> walls = new ArrayList<Wall>();
DisjointSets sets;

int k = 20;
int sz = 400;

void setup() {
  size(450, 450);

  for (int i = 0; i <= sz; i += (sz / k)) {
    for (int j = 0; j < sz; j += (sz / k)) {
      walls.add(new Wall(i, j, sz / k, 1));
    }
  }

  for (int i = 0; i < sz; i += (sz / k)) {
    for (int j = 0; j <= sz; j += (sz / k)) {
      walls.add(new Wall(i, j, sz / k, 0));
    }
  }

  Collections.shuffle(walls);
  sets = new DisjointSets(k * k);
}

void draw() {
  translate(25, 25);
  background(51);

  noStroke();
  fill(240, 188, 92);
  rect(0, 0, sz, sz);

  if ((frameCount - 1) < walls.size())
    walls.get(frameCount - 1).current = true;
  for (Wall w : walls) {
    w.show();
  }

  if ((frameCount - 1) < walls.size()) {
    // ALGORITHM
    int i = walls.get(frameCount - 1).x / (sz / k);
    int j = walls.get(frameCount - 1).y / (sz / k);
    int horv = walls.get(frameCount - 1).horv;

    int cell1 = -1, cell2 = -1;
    if ((horv == 0 && i >= 0 && (j > 0 && j < k) || 
      (horv == 1 && (i > 0 && i < k) && j >= 0))) {
      if (horv == 1) {
        cell1 = (i - 1) * k + j;
        cell2 = i * k + j;
      } else {
        cell1 = i * k + (j - 1);
        cell2 = i * k + j;
      }
    }

    if (cell1 >= 0 && cell2 >= 0 && sets.find(cell1) != sets.find(cell2)) {
      walls.get(frameCount - 1).show = false;
      sets.union(sets.find(cell1), sets.find(cell2));
    }

    walls.get(frameCount - 1).current = false;
  }
}
