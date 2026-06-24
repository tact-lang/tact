struct Leaf {
  val: Int;
}

struct Node {
  left: Leaf;
  right: Leaf;
}

struct Root {
  l: Node;
  r: Node;
}

contract TreeStorage {
  root: Root;

  init() {
    self.root = Root{
      l: Node{ left: Leaf{ val: 1 }, right: Leaf{ val: 2 } },
      r: Node{ left: Leaf{ val: 3 }, right: Leaf{ val: 4 } }
    };
  }
}
