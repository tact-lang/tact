struct Inner {
  x: Int;
}

contract OptionalsTest {
  a : Inner?;
  b : Inner?;
  c : Inner?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}