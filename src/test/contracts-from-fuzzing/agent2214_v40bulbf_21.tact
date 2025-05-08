struct S1 { x: Int; }
struct S2 { y: Int; }

struct Combo {
   a: S1?;
   b: S2?;
}

contract OptStructs {
  val: Combo;

  init() {
    self.val = Combo{
      a: null,
      b: null
    };
  }
}