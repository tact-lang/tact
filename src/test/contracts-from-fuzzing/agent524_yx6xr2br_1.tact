struct Inner {
  x: Int;
  y: Bool?;
}

struct Outer {
  a: Inner;
  b: String?;
}

contract NestedFields {
  state: Outer;

  init() {
    self.state = Outer{
      a: Inner{ x: 1, y: true },
      b: "hi",
    };
  }
}