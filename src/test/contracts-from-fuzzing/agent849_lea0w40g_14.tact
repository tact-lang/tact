struct Leaf {
  leafVal: Int;
}

struct Node {
  left: Leaf?;
  right: Leaf?;
}

contract OptionalTree {
  node: Node;

  init() {
    self.node = Node{ left:null, right:null };
  }
}