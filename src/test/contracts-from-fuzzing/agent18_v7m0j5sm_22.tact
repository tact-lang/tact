struct Leaf { val: Int; }

struct Node {
  left: Leaf?;
  right: Leaf?;
}

struct Tree {
  root: Node?;
}

contract NullableTree {
  tree: Tree;

  init() {
    self.tree = Tree{ root: null };
  }
}