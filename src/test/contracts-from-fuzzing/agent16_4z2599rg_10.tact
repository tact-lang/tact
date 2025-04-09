struct OneField {
  value: Int;
}

contract Test {
  a: OneField;
  b: OneField;
  c: OneField;
  d: OneField;

  init() {
    self.a = OneField{value: 1};
    self.b = OneField{value: 2};
    self.c = OneField{value: 3};
    self.d = OneField{value: 4};
  }
}