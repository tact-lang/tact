struct S {
  x: Int;
}

contract InitStructInField {
  sField: S = S{x: 5};

  init() {
    self.sField = S{x: 7};
  }
}
