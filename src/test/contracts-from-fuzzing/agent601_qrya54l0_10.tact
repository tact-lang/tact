// deeply nested optional inside struct, inside another optional contract field
struct Leaf {
  val: Int?;
}

struct Node {
  leaf: Leaf?;
}

contract Test {
  tree: Node?;

  init() {
    self.tree = null;
  }
}
