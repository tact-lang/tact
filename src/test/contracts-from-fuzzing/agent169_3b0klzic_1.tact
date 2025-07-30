struct Nested {
  a: Int;
  b: Bool;
}

contract Test {
  val1: Int;
  val2: Bool;
  val3: String;
  val4: Address;
  val5: Slice;
  nested: Nested;

  init() {
    self.val1 = 1;
    self.val2 = true;
    self.val3 = "test";
    self.val4 = myAddress();
    self.val5 = emptyCell().asSlice();
    self.nested = Nested{ a: 10, b: false };
  }
}