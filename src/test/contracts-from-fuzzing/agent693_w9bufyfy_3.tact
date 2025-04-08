struct Leaf {
  a: Int as uint8;
  b: Bool;
}

struct Node {
  leaf: Leaf;
  c: String;
  d: Int?;
}

contract Test {
  node: Node;

  init() {
    self.node = Node{
      leaf: Leaf{a: 7, b: true},
      c: "hello",
      d: null
    };
  }

  receive() {
    self.node = Node{
      leaf: Leaf{a: self.node.leaf.a + 1, b: false},
      c: "",
      d: 5
    };
  }
}
