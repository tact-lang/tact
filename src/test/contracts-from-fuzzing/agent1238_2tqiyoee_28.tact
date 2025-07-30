struct Simple {
  a: Int;
  b: Bool;
}

contract OptionalStructField {
  s: Simple?;

  init() {
    self.s = null;
  }
}