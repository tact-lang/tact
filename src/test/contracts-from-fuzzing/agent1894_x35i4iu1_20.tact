struct Inner {
  z: Int;
}

contract OptStructOptField {
  a: Inner?;

  init() {
    self.a = null;
  }
}