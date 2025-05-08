// deeply nested, optional inside nested struct inside array-like struct
struct Leaf {
  a: Int; b: Bool?;
}

struct Mid {
  l1: Leaf;
  l2: Leaf;
}

struct Top {
  m1: Mid;
  m2: Mid;
}

contract DeepOpt {
  data: Top;
  init() {
    self.data = Top{
      m1: Mid{ l1: Leaf{ a:1, b:null }, l2: Leaf{a:2, b:null}},
      m2: Mid{ l1: Leaf{ a:3, b:null }, l2: Leaf{a:4, b:null}}
    };
  }
}