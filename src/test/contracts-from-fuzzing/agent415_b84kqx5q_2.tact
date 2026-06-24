struct Inner {
  a: Int;
  b: Bool;
  c: String?;
}

struct Outer {
  inner: Inner;
  d: Bool;
  e: Int?;
}

contract NestedStructTest {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{
        a: 5,
        b: true,
        c: null,
      },
      d: false,
      e: null,
    };
  }
}