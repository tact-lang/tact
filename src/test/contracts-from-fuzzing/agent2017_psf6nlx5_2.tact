struct DeepNestA {
  a: Int;
}

struct DeepNestB {
  b: DeepNestA;
}

struct DeepNestC {
  c: DeepNestB;
}

contract TestContract {
  nest: DeepNestC;

  init() {
    self.nest = DeepNestC{
      c: DeepNestB{
        b: DeepNestA{
          a: 42,
        },
      },
    };
  }
}
