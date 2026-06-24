struct S {
  a: Int;
  b: Bool;
}

contract Test {
  optS: S?;

  init() {
    self.optS = S{ a:1, b:false };
  }
}
