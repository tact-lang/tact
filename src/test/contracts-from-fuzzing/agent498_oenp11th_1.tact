struct InnerMost {
  a: Int;
  b: Bool;
}

struct Inner {
  x: Int?;
  y: InnerMost;
}

struct Outer {
  foo: Bool;
  bar: Inner;
}

contract DeepNestContract {
  data: Outer;

  init() {
    self.data = Outer{
      foo: true,
      bar: Inner{
        x: 123,
        y: InnerMost{ a: 456, b: false }
      }
    };
  }
}
