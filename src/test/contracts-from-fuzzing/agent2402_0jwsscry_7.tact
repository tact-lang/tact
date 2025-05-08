struct Leaf {
  value: Int;
}

struct Mid {
  a: Leaf;
  b: Leaf;
}

struct MidOpt {
  c: Leaf?;
  d: Leaf?;
}

struct Root {
  left: Mid;
  right: MidOpt;
}

contract NestedTree {
  tree: Root;

  init() {
    self.tree = Root{
      left: Mid{
        a: Leaf{value: 1},
        b: Leaf{value: 2}
      },
      right: MidOpt{
        c: null,
        d: Leaf{value: 3}
      }
    };
  }
}