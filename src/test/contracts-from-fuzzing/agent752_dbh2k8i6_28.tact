struct S {
  nested: Int as uint32;
  b: Bool;
}

contract SerialFormats {
  data: S;
  init() {
    self.data = S{ nested: 500, b: true };
  }
}