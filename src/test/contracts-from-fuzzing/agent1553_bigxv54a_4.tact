struct Deep3 {
  d: Int;
}

struct Deep2 {
  c: Deep3;
}

struct Deep1 {
  b: Deep2;
}

struct Root {
  a: Deep1;
}

contract TestDeep {
  root: Root;

  init() {
    self.root = Root{a: Deep1{b: Deep2{c: Deep3{d: 42}}}};
  }
}