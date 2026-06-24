struct Leaf {
  x: Int;
}

struct MiddleA {
  leaf: Leaf;
}

struct MiddleB {
  leaf: Leaf;
}

struct Root {
  a: MiddleA;
  b: MiddleB;
}

contract DiamondNested {
  root: Root;

  init() {
    self.root = Root{
      a: MiddleA{leaf: Leaf{x: 1}},
      b: MiddleB{leaf: Leaf{x: 2}}
    };
  }
}