struct DeepA {
  x: Int;
}

struct DeepB {
  a: DeepA;
}

struct DeepC {
  b: DeepB;
}

struct DeepD {
  c: DeepC;
}

contract ExtraDeepNesting {
  root: DeepD;

  init() {
    self.root = DeepD{
      c: DeepC{
        b: DeepB{
          a: DeepA{
            x: 777
          }
        }
      }
    };
  }
}