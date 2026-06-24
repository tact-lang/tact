struct Small {
 a: Int;
}

struct Medium {
  s1: Small;
  s2: Small;
}

struct Large {
  m1: Medium;
  m2: Medium;
}

contract NestedTree {
  all: Large;

  init() {
    self.all = Large{
      m1: Medium{ s1: Small{a:1}, s2: Small{a:2} },
      m2: Medium{ s1: Small{a:3}, s2: Small{a:4} }
    };
  }
}