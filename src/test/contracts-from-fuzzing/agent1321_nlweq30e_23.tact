// deeply nested struct with optional booleans
struct Leaf {
  f: Bool?;
}

struct Node {
  leaf: Leaf?;
}

struct Root {
  node: Node?;
}

contract OptBoolDeep {
  root: Root;

  init() {
    self.root = Root{ node: Node{ leaf: Leaf{ f:true } } };
  }
}
