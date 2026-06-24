struct Fixed {
  a: Int as uint8;
  b: Int as int16;
}

contract FixedSer {
  st: Fixed;

  init() {
    self.st = Fixed{a: 5, b: -34};
  }
}