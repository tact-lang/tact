contract ManyFields {
  f1: Int;
  f2: Bool;
  f3: Int?;
  f4: Bool;
  f5: String;
  f6: String;
  f7: Address;
  f8: Cell;
  f9: Slice;
  f10: Int;

  init() {
    self.f1 = 1;
    self.f2 = true;
    self.f3 = null;
    self.f4 = false;
    self.f5 = "hello";
    self.f6 = "world";
    self.f7 = myAddress();
    self.f8 = emptyCell();
    self.f9 = emptyCell().asSlice();
    self.f10 = 42;
  }
}