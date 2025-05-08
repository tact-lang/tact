struct StructA {
  x: Int;
}

struct StructB {
  a: StructA;
}

struct StructC {
  b: StructB;
}

contract NestedSameChain {
  f: StructC;
  init() {
    self.f = StructC{
      b: StructB{
        a: StructA{
          x: 3
        }
      }
    };
  }
}