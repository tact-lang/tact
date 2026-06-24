// Intentionally assign out of range values, expecting compiler warns or errors
contract OutOfRangeInit {
  a: Int as uint4;
  b: Int as int5;

  init() {
    self.a = 20;   // exceeds uint4 max (15)
    self.b = 20;   // exceeds int5 max (15)
  }
}