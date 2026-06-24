contract OptionalStorage {
  val1: Int?;
  val2: Bool?;
  val3: Address?;
  val4: Cell?;
  val5: Slice?;
  val6: String?;

  init() {
    self.val1 = null;
    self.val2 = true;
    self.val3 = null;
    self.val4 = null;
    self.val5 = emptyCell().asSlice();
    self.val6 = null;
  }
}