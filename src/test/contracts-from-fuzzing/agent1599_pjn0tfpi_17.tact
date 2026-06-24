struct Child {
  c1: Int;
  c2: String?;
  c3: Bool;
}

struct Parent {
  p1: Child;
  p2: Child;
}

contract Test {
  parentData: Parent;

  init() {
    self.parentData = Parent{
      p1: Child{ c1: 1, c2: null, c3: false },
      p2: Child{ c1: 2, c2: "hello", c3: true },
    };
  }
}