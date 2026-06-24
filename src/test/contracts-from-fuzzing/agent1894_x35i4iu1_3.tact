struct Inner {
  x: Int;
  y: String;
}

struct Outer {
  i1: Inner;
  i2: Inner;
}

contract NestedStructFields {
  val: Outer;

  init() {
    self.val = Outer{
      i1: Inner{ x: 1, y: "a" },
      i2: Inner{ x: 2, y: "b" }
    };
  }
}