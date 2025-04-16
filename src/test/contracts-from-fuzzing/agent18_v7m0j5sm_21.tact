struct Leaf { val:Int; }

struct Node {
  left: Leaf?;
  right: Leaf?;
}

contract NullableBinaryTree {
  root: Node;

  init() {
    self.root = Node{ left:null, right:Leaf{val:123} };
  }
}