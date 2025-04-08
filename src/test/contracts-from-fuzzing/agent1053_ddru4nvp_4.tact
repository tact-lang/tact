struct S {
  x: Int;
  y: Bool;
}

contract OptStructDirect {
  data: S?;

  init() {
    self.data = null;
  }
}