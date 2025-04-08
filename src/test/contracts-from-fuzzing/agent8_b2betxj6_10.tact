struct DeepA {
  x: Int;
  b: DeepB;
}

struct DeepB {
  y: Int;
  c: DeepC;
}

struct DeepC {
  z: Int;
}

contract DeepChain {
  deepField: DeepA;

  init() {
    self.deepField = DeepA{
      x: 1,
      b: DeepB{
        y: 2,
        c: DeepC{
          z: 3,
        }
      }
    };
  }
}