struct Deep1 { x: Int; }
struct Deep2 { d1: Deep1; }
struct Deep3 { d2: Deep2; }

contract Test {
  nested: Deep3;
  init() {
    self.nested = Deep3{d2: Deep2{d1: Deep1{x: 99}}};
  }
}