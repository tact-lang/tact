struct Nested {
  n1: Int;
  n2: Bool;
}

contract Test {
  f1: Int = 1;
  f2: Bool = true;
  f3: String = "abc";
  f4: Slice;
  f5: Cell;
  f6: Address;
  f7: Nested;

  init() {
    self.f4 = emptyCell().asSlice();
    self.f5 = emptyCell();
    self.f6 = myAddress();
    self.f7 = Nested{ n1: 42, n2: false };
  }
}