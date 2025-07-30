struct SNest {
  a: Int as uint8;
  b: Bool;
}

contract TopSerNest {
  s: SNest;
  x: Int as int32;

  init() {
    self.s = SNest{ a: 5, b: true };
    self.x = -12345;
  }
}
