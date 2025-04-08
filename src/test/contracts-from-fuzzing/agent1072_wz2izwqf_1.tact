struct InnerMost {
  x: Int;
}

struct Inner {
  a: Int;
  b: Bool;
  c: InnerMost;
}

struct Outer {
  p: String;
  q: Bool?;
  r: Inner;
}

contract NestedStructTest {
  data: Outer;

  init() {
    self.data = Outer{
      p: "hello",
      q: true,
      r: Inner{
        a: 123,
        b: false,
        c: InnerMost{
          x: 999
        }
      }
    };
  }
}
