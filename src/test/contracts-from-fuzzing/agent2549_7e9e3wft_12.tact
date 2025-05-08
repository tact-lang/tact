struct Leaf {
  v: Int;
}

struct Node {
  left: Leaf?;
  right: Leaf?;
}

contract BinTree {
  root: Node;

  init() {
    self.root = Node{
      left: Leaf{v: 1},
      right: null,
    };
  }
}