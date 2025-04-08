struct ComposeA {
  a: Int;
}

struct ComposeB {
  b: Int;
}

struct CombineAB {
  a: ComposeA;
  b: ComposeB;
}

contract ComposedStructs {
  val: CombineAB;

  init() {
    self.val = CombineAB{
      a: ComposeA{a:1},
      b: ComposeB{b:2}
    };
  }
}
