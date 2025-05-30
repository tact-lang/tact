struct Inner {
  x: Int;
  y: Int?;
}

contract NestedOptionalFields {
  pos: Inner;

  init() {
    self.pos = Inner{ x: 1, y: null };
  }
}