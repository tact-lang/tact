struct OptOnly {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
}

contract NestedAllOptional {
  nested: OptOnly?;

  init() {
    self.nested = null;
  }
}