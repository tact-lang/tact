struct VariantInner {
  a: Int;
  b: Bool;
}

contract VariantNestedDefaults {
  field: VariantInner? = null;

  init() {
    self.field = null;
  }
}
