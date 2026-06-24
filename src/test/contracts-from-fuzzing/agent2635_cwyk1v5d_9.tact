contract MixedFields {
  val1: Int;
  val2: Bool = false;
  val3: Address;
  val4: Slice;
  val5: Cell;
  val6: String = "default";

  init() {
    self.val1 = 123;
    self.val3 = myAddress();
    self.val4 = emptyCell().asSlice();
    self.val5 = emptyCell();
  }
}