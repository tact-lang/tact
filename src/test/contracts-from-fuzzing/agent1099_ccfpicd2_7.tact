struct Leaf {
  x: Int;
}

struct Node {
  l: Leaf;
  n: Leaf?;
}

struct Tree {
  root: Node;
  spare: Node?;
}

contract ComplexNested {
  tree: Tree;

  init() {
    self.tree = Tree{
      root: Node{
        l: Leaf{ x: 5 },
        n: null,
      },
      spare: null,
    };
  }
}