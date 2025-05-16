struct Small {
  a: Int;
}

struct Mid {
  s1: Small;
  s2: Small;
}

struct Large {
  m1: Mid;
  m2: Mid;
  m3: Mid;
}

contract LargerStructTest {
  big: Large;

  init() {
    self.big = Large{
      m1: Mid{ s1: Small{a:1}, s2: Small{a:2} },
      m2: Mid{ s1: Small{a:3}, s2: Small{a:4} },
      m3: Mid{ s1: Small{a:5}, s2: Small{a:6} }
    };
  }
}