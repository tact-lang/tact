struct DeepOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
}

contract OptionalOuterInner {
  nested: DeepOptionals?;
  init() {
    self.nested = null;
  }
}