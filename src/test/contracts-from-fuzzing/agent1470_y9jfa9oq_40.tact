// struct with nested optional struct, with all fields null, testing serialization of fully null nested branches
struct Leaf {
  a: Int?;
}

struct Node {
  leaf: Leaf?;
}

contract NullTree {
  root: Node?;

  init() {
    self.root = null;
  }
}