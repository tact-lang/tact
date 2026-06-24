struct AllOptional {
  a: Int?;
  b: Bool?;
  c: Address?;
}

contract OptionalEverything {
  value: AllOptional?;
  init() {
    self.value = null;
  }
}