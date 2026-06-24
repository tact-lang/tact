struct Deep {
  foo: Int as uint32;
  bar: Bool;
  opt: Int?;
}

contract WithDeep {
  x: Deep;

  init() {
    self.x = Deep{ foo: 1, bar: true };
  }
}