struct InnerMost {
  x: Int;
}

struct Middle {
  mid1: Int;
  inn: InnerMost;
  opt: String?;
}

struct Top {
  m1: Middle;
  m2: Middle;
  m3: Middle;
}

contract DeepWide {
  root: Top;

  init() {
    let m = Middle{ mid1: 1, inn: InnerMost{ x:2 }, opt:null };
    self.root = Top{ m1: m, m2: m, m3: m };
  }
}