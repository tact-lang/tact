contract LongList {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Cell;
  f5: Bool;
  f6: Address;
  f7: String;
  f8: Int;
  f9: Bool;
  f10: String;
  f11: Address;
  f12: Cell;

  init() {
    self.f1 = 1;
    self.f2 = true;
    self.f3 = "a";
    self.f4 = emptyCell();
    self.f5 = false;
    self.f6 = myAddress();
    self.f7 = "b";
    self.f8 = 8;
    self.f9 = true;
    self.f10 = "c";
    self.f11 = myAddress();
    self.f12 = emptyCell();
  }
}