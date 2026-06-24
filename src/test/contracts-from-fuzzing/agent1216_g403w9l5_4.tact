struct Deeply {
  a: Int;
  b: Bool;
}

struct Mid {
  d1: Deeply;
  d2: Deeply;
}

struct Top {
  m1: Mid;
  m2: Mid;
}

contract DeepStructTest {
  t: Top;

  init() {
    self.t = Top{
      m1: Mid{ d1: Deeply{a:1,b:true}, d2: Deeply{a:2,b:false} },
      m2: Mid{ d1: Deeply{a:3,b:true}, d2: Deeply{a:4,b:false} },
    };
  }
}