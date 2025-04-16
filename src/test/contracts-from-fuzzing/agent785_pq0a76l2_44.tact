// Test optional Int with explicit serialization annotation
contract OptWithFormat {
  a: Int? as uint17;
  init() {
    self.a = 12345;
  }
}
