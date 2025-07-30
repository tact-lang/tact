struct Packed {
  a: Int? as uint8;
  b: Int? as int16;
  c: Bool?;
}

contract TestContract {
  x: Packed;
  init() {
    self.x = Packed{ a: null, b: -12, c: true };
  }
}