struct Inner {
  d: Int;
}

struct Outer {
  a: Int;
  b: Bool;
  c: Inner;
  e: String;
  f: Int?;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      a: 1,
      b: true,
      c: Inner{d: 2},
      e: "hi",
      f: null,
    };
  }
}