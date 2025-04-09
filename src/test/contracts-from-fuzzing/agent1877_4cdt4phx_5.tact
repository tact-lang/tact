struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  inner1: Inner;
  inner2: Inner?;
  text: String;
}

contract MultiNestedOptional {
  s: Outer;

  init() {
    self.s = Outer{
      inner1: Inner{ x: 10, y: null },
      inner2: null,
      text: "abc"
    };
  }
}
