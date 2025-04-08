struct Nested {
  number: Int;
  flag: Bool;
}

contract DeepTest {
  field1: Int = 5;
  nest: Nested;

  init() {
    self.field1 = 10;
    self.nest = Nested{ number: 1, flag: true };
  }
}