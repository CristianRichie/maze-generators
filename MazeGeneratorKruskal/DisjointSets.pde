import java.io.*;
import java.util.*;

class DisjointSets {
  int[] rank, parent;
  int n;

  DisjointSets(int n) {
    rank = new int[n];
    parent = new int[n];
    this.n = n;
    makeSet();
  }

  void makeSet() {
    for (int i = 0; i < n; i ++) {
      parent[i] = i;
    }
  }  

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int x, int y) {
    int x_root = find(x);
    int y_root = find(y);

    if (x_root == y_root)
      return;

    if (rank[x_root] < rank[y_root]) {
      parent[x_root] = y_root;
    } else if (rank[y_root] < rank[x_root]) {
      parent[y_root] = x_root;
    } else {
      parent[y_root] = x_root;
      rank[x_root] += 1;
    }
  }
}
