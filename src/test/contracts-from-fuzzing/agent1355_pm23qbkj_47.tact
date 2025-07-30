trait T {
  x: Int;
}
contract InheritWithVar with T {
  x: Int;

  init() {
    self.x = 33;
  }
}