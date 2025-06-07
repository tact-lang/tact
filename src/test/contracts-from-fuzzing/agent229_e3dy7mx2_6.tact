contract LongFields {
  f01: Int;
  f02: Int;
  f03: Bool;
  f04: Bool;
  f05: String;
  f06: String;
  f07: Cell;
  f08: Slice;
  f09: Builder;
  f10: Address;
  f11: Int;
  f12: Int;
  f13: Bool;
  f14: Bool;
  f15: String;
  f16: String;

  init() {
    self.f01 = 1;
    self.f02 = 2;
    self.f03 = true;
    self.f04 = false;
    self.f05 = "a";
    self.f06 = "b";
    self.f07 = emptyCell();
    self.f08 = emptyCell().asSlice();
    self.f09 = beginCell();
    self.f10 = myAddress();
    self.f11 = 11;
    self.f12 = 12;
    self.f13 = true;
    self.f14 = false;
    self.f15 = "c";
    self.f16 = "d";
  }
}
