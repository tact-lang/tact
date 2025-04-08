struct OptionalNested {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalNestedContract {
  val: OptionalNested;

  init() {
    self.val = OptionalNested{ a: null, b: null, c: null };
  }
}