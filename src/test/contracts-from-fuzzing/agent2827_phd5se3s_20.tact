struct Leaf {
  val: Int;
}

struct Mid {
  l1: Leaf;
  l2: Leaf;
}

struct Root {
  m1: Mid;
  m2: Mid;
}

contract BigTree {
  r: Root;
  init() {
    self.r = Root{
      m1: Mid{l1: Leaf{val:1}, l2:Leaf{val:2}},
      m2: Mid{l1: Leaf{val:3}, l2:Leaf{val:4}}
    };
  }
}