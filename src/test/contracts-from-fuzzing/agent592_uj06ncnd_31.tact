struct IntString {
  i: Int;
  s: String;
}

contract OptNestedStrings {
  a: IntString?;
  b: IntString?;

  init() {
    self.a = null;
    self.b = null;
  }
}