contract NestedOptionalsInContract {
  optional1: Int?;
  optional2: Bool?;
  optional3: String?;
  optional4: Cell?;
  optional5: Slice?;
  optional6: Address?;

  init() {
    self.optional1 = 1;
    self.optional2 = false;
    self.optional3 = "hi";
    self.optional4 = emptyCell();
    self.optional5 = emptyCell().asSlice();
    self.optional6 = myAddress();
  }
}
