struct Inner {
  value1: Int;
  value2: Bool;
}

struct Outer {
  a: Int;
  b: String;
  c: Bool;
  d: Inner;
  e: Int?;
  f: String;
  g: Bool;
  h: Inner;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      a: 10,
      b: "hello",
      c: false,
      d: Inner{ value1: 1, value2: true },
      e: null,
      f: "world",
      g: true,
      h: Inner{ value1: 2, value2: false },
    };
  }
}
