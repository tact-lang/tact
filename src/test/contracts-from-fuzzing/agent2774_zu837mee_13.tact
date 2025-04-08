// persistent variable with explicit serialization formats
contract TestContract {
  x1: Int as int64;
  x2: Int as uint8;
  x3: Int as int16;
  x4: Int as uint256;

  init() {
    self.x1 = 123;
    self.x2 = 5;
    self.x3 = -99;
    self.x4 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
  }
}