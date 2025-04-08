struct Inner {
  x: Int;
}

/// outer optional wrapping inner struct
contract OptionalOuterStruct {
  s: Inner?;

  init() {
    self.s = null;
  }
}