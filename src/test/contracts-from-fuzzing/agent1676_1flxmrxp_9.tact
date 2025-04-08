struct Leaf {
  x: Int;
}

struct Mid {
  l1: Leaf;
  l2: Leaf;
}

struct Root {
  m1: Mid;
  m2: Mid;
}

contract MultipleDeepNested {
  val: Root;

  init() {
    self.val = Root{
      m1: Mid{ l1: Leaf{ x: 1 }, l2: Leaf{ x: 2 } },
      m2: Mid{ l1: Leaf{ x: 3 }, l2: Leaf{ x: 4 } },
    };
  }
}