struct Leaf {
  foo: Int;
}

struct Mid {
  nest: Leaf;
}

contract PartialInitTest {
  s: Mid;

  init() {
    self.s = Mid{ nest: Leaf{ foo: 3 } };
  }
}
