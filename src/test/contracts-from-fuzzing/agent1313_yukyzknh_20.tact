struct S {
  x: Int;
  y: Int;
}
contract SOptField {
  f: S?;

  init() {
    self.f = null;
  }
}