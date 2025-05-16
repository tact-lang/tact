// Persistent contract top-level fields with mixed initialization
contract MixedFields {
  a: Int = 0;
  b: Bool;
  c: String = "test";

  init() {
    self.b = false;
  }
}
