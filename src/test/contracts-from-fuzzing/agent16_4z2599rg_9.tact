// Mixing a variety of primitives and optionals
contract Test {
  intField: Int;
  boolField: Bool;
  stringField: String;
  cellField: Cell;
  sliceField: Slice;
  builderField: Builder;
  addressField: Address;
  optInt: Int?;
  optBool: Bool?;
  optString: String?;

  init() {
    self.intField = -1;
    self.boolField = true;
    self.stringField = "test";
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.builderField = beginCell();
    self.addressField = myAddress();
    self.optInt = null;
    self.optBool = null;
    self.optString = "ok";
  }
}