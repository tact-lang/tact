struct Inner {
  a: Int;
  b: String;
}

contract ManyTypes {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  addressVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  optInt: Int?;
  optBool: Bool?;
  nested: Inner;

  init() {
    self.intVal = 5;
    self.boolVal = true;
    self.stringVal = "ok";
    self.addressVal = myAddress();
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.builderVal = beginCell();
    self.optInt = null;
    self.optBool = null;
    self.nested = Inner{ a: 42, b: "hi" };
  }
}