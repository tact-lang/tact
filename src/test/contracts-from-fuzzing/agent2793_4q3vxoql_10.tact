struct Child {
  c1: Int;
  c2: Int;
}

struct Parent {
  pc1: Child;
  pc2: Child;
  pc3: Child;
  pc4: Child;
}

contract LargeNested {
  nested: Parent;
  init() {
    self.nested = Parent{
      pc1: Child{c1:1, c2:2},
      pc2: Child{c1:3, c2:4},
      pc3: Child{c1:5, c2:6},
      pc4: Child{c1:7, c2:8}
    };
  }
}