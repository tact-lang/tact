struct Nested {
  b: Int;
  c: Bool;
}

contract DeepSingleField {
  inner: Nested;

  init() {
    self.inner = Nested{b: 10, c: true};
  }
}