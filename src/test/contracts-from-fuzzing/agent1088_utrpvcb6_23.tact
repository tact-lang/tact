struct RecStub {
  head: Int;
  tail: Int?;
}

contract RecApprox {
  r: RecStub?;

  init() {
    self.r = null;
  }
}