struct S {
  x: Int?;
  y: Bool?;
}

contract NestedNullable {
  f: S?;

  init() {
    self.f = S {
      x: null,
      y: null
    };
  }
}