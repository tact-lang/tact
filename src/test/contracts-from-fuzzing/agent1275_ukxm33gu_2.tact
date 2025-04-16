struct Inner {
  a: Int;
  b: Bool;
}

struct Middle {
  x: Int;
  inner: Inner;
}

struct Outer {
  mid: Middle;
  optMid: Middle?;
}

contract NestedStructsTest {
  data: Outer;

  init() {
    self.data = Outer{
      mid: Middle{
        x: 1,
        inner: Inner{ a: 2, b: true }
      },
      optMid: null
    };
  }
}