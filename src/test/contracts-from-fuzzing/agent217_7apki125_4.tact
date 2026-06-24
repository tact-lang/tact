struct NestedOpt {
  a: Int?;
}

contract OptChainTest {
  x: NestedOpt?;
  y: Int;

  init() {
    self.x = null;
    self.y = 42;
  }
}