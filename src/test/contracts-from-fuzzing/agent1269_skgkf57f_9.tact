struct Base {
  x: Int;
  y: Int;
}

struct NestedOpt {
  a: Int?;
  b: Int;
  c: Base?;
}

contract OptContainer {
  state: NestedOpt;
  init() {
    self.state = NestedOpt{
      a: null,
      b: 1,
      c: Base{ x: 7, y: 8 },
    };
  }
}
