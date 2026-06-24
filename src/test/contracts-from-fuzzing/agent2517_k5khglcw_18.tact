struct Tail {
  a: Int;
  b: Slice as remaining;
}

contract Test {
  tOpt: Tail?;

  init() {
    self.tOpt = null;
  }
}