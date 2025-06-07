contract MixedPrimitives {
  anInt: Int = 5;
  aBool: Bool = true;
  aStr: String = "hello";
  aSlice: Slice;
  aCell: Cell;
  anAddr: Address;

  init() {
    self.aSlice = emptyCell().asSlice();
    self.aCell = emptyCell();
    self.anAddr = myAddress();
  }
}
