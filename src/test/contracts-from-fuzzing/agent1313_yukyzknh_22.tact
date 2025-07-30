struct Mid {
  a: Int;
  b: Int;
}

struct Top {
  m1: Mid;
  m2: Mid;
}

contract MultiStructFields {
  top: Top;

  init() {
    self.top = Top{
      m1: Mid{a:1,b:2},
      m2: Mid{a:3,b:4}
    };
  }
}