struct Simple {
  x: Int;
}

contract OptionalStruct {
  s: Simple?;

  init() {
    self.s = null;
  }
}