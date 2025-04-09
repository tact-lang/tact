struct DeepA {
  x: Int;
}

struct DeepB {
  a: DeepA;
  y: Int;
}

struct DeepC {
  b: DeepB;
  z: Int;
}

contract DeepNestTest {
  big: DeepC;

  init() {
    self.big = DeepC{
      b: DeepB{
        a: DeepA{ x: 1 },
        y: 2
      },
      z: 3
    };
  }
}