struct Leaf {
  z: Bool;
}

struct Node {
  left: Leaf;
  right: Leaf;
}

contract BinTree {
  root: Node;

  init() {
    self.root = Node{
      left: Leaf{z: true},
      right: Leaf{z: false},
    };
  }
}