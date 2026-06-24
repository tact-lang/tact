struct Leaf {
  f: Int;
}

struct Branch {
  l1: Leaf;
  l2: Leaf;
}

struct Root {
  b1: Branch;
  b2: Branch;
}

contract Tree {
  r: Root;

  init() {
    self.r = Root{
      b1: Branch{l1: Leaf{f:1}, l2:Leaf{f:2}},
      b2: Branch{l1: Leaf{f:3}, l2:Leaf{f:4}},
    };
  }
}