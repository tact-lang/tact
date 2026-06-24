struct DeepNest1 {
  foo: Int;
}

struct DeepNest2 {
  bar: DeepNest1;
}

struct DeepNest3 {
  baz: DeepNest2;
}

struct DeepNest4 {
  qux: DeepNest3;
}

contract DeepChain {
  chain: DeepNest4;

  init() {
    self.chain = DeepNest4{
      qux: DeepNest3{
        baz: DeepNest2{
          bar: DeepNest1{
            foo: 7,
          },
        },
      },
    };
  }
}
