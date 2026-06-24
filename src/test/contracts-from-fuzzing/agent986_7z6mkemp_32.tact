struct Tiny {
  a: Int;
}

struct Small {
  b: Tiny;
}

struct Middle {
  c: Small;
}

struct Big {
  d: Middle;
}

contract VeryDeepNested {
  x: Big;

  init() {
    self.x = Big{ d: Middle{ c: Small{ b: Tiny{ a: 1 } } } };
  }
}