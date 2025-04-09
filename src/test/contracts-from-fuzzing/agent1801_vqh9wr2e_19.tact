struct Sub {
  x: Int;
}

contract OptionalStruct {
  s: Sub?;

  init() {
    self.s = null;
  }
}