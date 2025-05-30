struct Small { a: Int; }

contract MultiNested {
  a: Small;
  b: Small;
  c: Small;
  d: Small;

  init() {
    self.a = Small{ a:1 };
    self.b = Small{ a:2 };
    self.c = Small{ a:3 };
    self.d = Small{ a:4 };
  }
}