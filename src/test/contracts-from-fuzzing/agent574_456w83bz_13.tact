// persistent storage with string optional defaulted explicitly to null
contract OptionalExplicitNull {
  a: String? = null;
  b: Int? = null;
  c: Bool? = null;

  init() {
    self.a = "hi";
    self.b = null;
    self.c = true;
  }
}