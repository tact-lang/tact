// Optional Int with explicit annotation below 2 bits
contract TinyUInt {
  a: Int? as uint1;
  init() {
    self.a = 1;
  }
}
