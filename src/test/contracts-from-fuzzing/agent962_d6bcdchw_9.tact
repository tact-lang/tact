struct NestedStruct {
  n1: Int;
  n2: Bool;
}

contract ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Address;
  f5: Cell;
  f6: Slice;
  f7: Int?;
  f8: Bool?;
  f9: String?;
  f10: Address?;
  f11: Cell?;
  f12: Slice?;
  f13: NestedStruct;

  init() {
    self.f1 = 1;
    self.f2 = true;
    self.f3 = "test";
    self.f4 = myAddress();
    self.f5 = emptyCell();
    self.f6 = emptyCell().asSlice();
    self.f7 = null;
    self.f8 = null;
    self.f9 = null;
    self.f10 = null;
    self.f11 = null;
    self.f12 = null;
    self.f13 = NestedStruct{ n1: 42, n2: true };
  }
}