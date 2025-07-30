struct One {
  a: Int;
}

struct Two {
  b: Int;
}

struct Three {
  c: Int;
}

contract LongStructList {
  f1: One;
  f2: Two;
  f3: Three;

  init() {
    self.f1 = One{a: 1};
    self.f2 = Two{b: 2};
    self.f3 = Three{c: 3};
  }

  receive() {
    let sum = self.f1.a + self.f2.b + self.f3.c;
  }
}