struct DeepNested {
  a: Int;
  b: Inner;
}

struct Inner {
  c: Bool;
  d: InnerMost;
}

struct InnerMost {
  e: String;
  f: Int?;
}

contract TestContract {
  data: DeepNested;

  init() {
    self.data = DeepNested{
      a:42,
      b: Inner{
        c: true,
        d: InnerMost{
          e: "hello",
          f: null,
        },
      },
    };
  }
}