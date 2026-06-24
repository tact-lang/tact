struct Inner {
  a: Int;
  b: Bool?;
  c: String;
}

struct Outer {
  inner1: Inner;
  inner2: Inner;
}

contract NestedStructs {
  data: Outer;

  init() {
    self.data = Outer{
      inner1: Inner{ a: 10, b: null, c: "hi" },
      inner2: Inner{ a: 20, b: true, c: "world" }
    };
  }
}
