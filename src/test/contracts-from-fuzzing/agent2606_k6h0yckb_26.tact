contract MixPrims {
  v1: Int = 1;
  v2: Bool = true;
  v3: String = "hi";
  v4: Cell;
  v5: Slice;
  v6: Address;

  init() {
    self.v4 = emptyCell();
    self.v5 = emptyCell().asSlice();
    self.v6 = myAddress();
  }
}