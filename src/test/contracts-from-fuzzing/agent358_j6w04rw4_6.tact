struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  a: Int;
  b: Bool;
  c: String;
  innerOpt: Inner?;
}

contract OptionalNest {
  data: Outer;

  init() {
    self.data = Outer{
      a: 5,
      b: true,
      c: "abc",
      innerOpt: null,
    };
  }
}