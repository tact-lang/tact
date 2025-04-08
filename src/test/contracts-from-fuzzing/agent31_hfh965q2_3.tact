struct Deep1 { a: Int; }
struct Deep2 { d1: Deep1; b: Int; }
struct Deep3 { d2: Deep2; c: Int; }

contract Test {
  val: Deep3;

  init() {
    self.val = Deep3{
      d2: Deep2{
        d1: Deep1{a: 9},
        b: 8
      },
      c: 7
    };
  }
}