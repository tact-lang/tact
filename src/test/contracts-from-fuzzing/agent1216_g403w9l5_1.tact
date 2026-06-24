struct Inner {
  a: Int;
  b: Bool?;
  c: String;
}

struct Outer {
  inner: Inner;
  d: Bool;
  e: Int?;
  f: String;
}

contract TestContract {
  x: Outer;

  init() {
    self.x = Outer{
      inner: Inner{
        a: 1,
        b: null,
        c: "hello",
      },
      d: true,
      e: null,
      f: "world",
    };
  }
}