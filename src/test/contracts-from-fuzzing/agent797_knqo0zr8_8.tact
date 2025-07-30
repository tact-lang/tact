struct Nested {
  a: Int;
  b: Inner;
}

struct Inner {
  c: Int;
  d: Bool;
  e: InnerMost;
}

struct InnerMost {
  f: Int;
  g: Bool?;
}

contract DeepChain {
  chain: Nested;

  init() {
    self.chain = Nested{
      a: 1,
      b: Inner{
        c: 2,
        d: true,
        e: InnerMost{
          f: 3,
          g: false,
        },
      },
    };
  }
}
