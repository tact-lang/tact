struct Inner {
  x: Int;
}

struct Outer {
  a: Bool;
  b: String;
  inner: Inner;
}

contract ReplaceInner {
  s: Outer;

  init() {
    self.s = Outer{
      a: true,
      b: "hi",
      inner: Inner{ x: 7 }
    };
  }
}