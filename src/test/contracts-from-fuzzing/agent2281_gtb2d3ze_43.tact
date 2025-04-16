struct S {
  b: Bool?;
}

contract NullableBoolStruct {
  s: S;

  init() {
    self.s = S{ b: null };
  }
}