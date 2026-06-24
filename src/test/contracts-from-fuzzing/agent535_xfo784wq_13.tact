struct S {
  f1: Int;
  f2: Bool;
  f3: Cell;
}

contract OptionalStructField {
  s: S?;

  init() {
    self.s = null;
  }
}