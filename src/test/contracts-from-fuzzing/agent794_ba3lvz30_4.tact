struct Inner {
  a: Int?;
  b: Bool? = null;
}

struct Outer {
  x: Int;
  inner: Inner;
}

contract NestedDefaults {
  data: Outer;

  init() {
    self.data = Outer{
      x: 10,
      inner: Inner{
        a: null,
        b: true
      }
    };
  }
}
