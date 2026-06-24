struct NestedMany {
  a: Int;
  b: Bool;
  c: String;
  d: Inner;
}

struct Inner {
  x: Int;
  y: Bool;
  z: String;
}

contract TestContract {
  nested: NestedMany;

  init() {
    self.nested = NestedMany{
      a: 1,
      b: true,
      c: "hi",
      d: Inner{ x:2, y:false, z:"hello" }
    };
  }
}