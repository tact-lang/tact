// test with only optional nested struct as persistent storage
struct OptionalNested {
  a: Int;
  b: Bool;
}
contract OptionalNestedField {
  data: OptionalNested?;

  init() {
    self.data = null;
  }
}