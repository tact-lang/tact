struct Leaf {
  data: Int;
}

struct Node {
  leaf: Leaf?;
  flag: Bool;
}

contract NestedOptionals {
  node: Node?;

  init() {
    self.node = Node{
      leaf: null,
      flag: true
    };
  }
}
