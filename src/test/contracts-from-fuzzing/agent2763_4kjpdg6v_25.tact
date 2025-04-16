struct Mid {
  sub1: Int;
  sub2: Int;
}

struct Top {
  m1: Mid; m2: Mid; m3: Mid;
}

contract TripleNested {
  n: Top;

  init() {
    self.n = Top{
      m1: Mid{sub1:1,sub2:2},
      m2: Mid{sub1:3,sub2:4},
      m3: Mid{sub1:5,sub2:6},
    };
  }
}