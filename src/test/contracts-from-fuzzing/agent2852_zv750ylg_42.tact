struct SSub {
  a:Int;
}

contract OptionalSSub {
  s: SSub?;
  init() {
    self.s = null;
  }
}