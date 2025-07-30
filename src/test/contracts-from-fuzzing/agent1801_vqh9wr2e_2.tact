struct Inner {
  a: Int;
  b: Int;
}

struct Outer {
  inner: Inner;
  flag: Bool;
}

contract DeepNested {
  field: Outer;
  init() {
    self.field = Outer{
      inner: Inner{
        a: 1,
        b: 2,
      },
      flag: true,
    };
  }
}