// mix of contract fields with serialization, defaults, optional
contract Varied {
  a: Int as uint8 = 255;
  b: Int = -1;
  c: Bool = false;
  d: Int?;
  e: Bool?;

  init() {
    self.d = null;
    self.e = true;
  }
}