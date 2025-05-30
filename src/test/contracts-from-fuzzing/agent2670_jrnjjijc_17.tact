struct HasBoolAndInt {
  condition: Bool;
  number: Int;
}

contract StructFieldWithBoolInt {
  combined: HasBoolAndInt;

  init() {
    self.combined = HasBoolAndInt{ condition: true, number: 123 };
  }
}