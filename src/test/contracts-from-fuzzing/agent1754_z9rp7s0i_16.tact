struct ComposeA {
  x: Int;
  y: ComposeB;
}

struct ComposeB {
  z: Int;
  t: ComposeC;
}

struct ComposeC {
  w: Int;
}

contract ComposeTest {
  field: ComposeA;
  init() {
    self.field = ComposeA{
      x:1,
      y:ComposeB{
        z:2,
        t:ComposeC{w:3}
      }
    };
  }
}