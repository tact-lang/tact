struct InnerNested {
  x: Int;
  y: Bool;
}

struct OuterNested {
  inner: InnerNested;
  active: Bool;
}

contract TestContract {
  info: OuterNested;

  init() {
    self.info = OuterNested{
      inner: InnerNested{x: 10, y: false},
      active: true
    };
  }
}