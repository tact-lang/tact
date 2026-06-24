struct Leaf {
  val: Int as uint8;
}

struct Node {
  left: Leaf;
  right: Leaf;
}

contract SerializeTest {
  node: Node;

  init() {
    self.node = Node{
      left: Leaf{ val: 10 },
      right: Leaf{ val: 20 },
    };
  }
}