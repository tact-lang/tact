struct Nested {
  inner: Int;
}

contract DiverseFields {
  field1: Int;
  field2: Bool;
  field3: String;
  field4: Cell;
  field5: Slice;
  field6: Address;
  field8: Int?;
  field9: Bool?;
  field10: Address?;
  field11: Nested;
  field12: Nested?;

  init() {
    self.field1 = 1;
    self.field2 = true;
    self.field3 = "ok";
    self.field4 = emptyCell();
    self.field5 = emptyCell().asSlice();
    self.field6 = myAddress();
    self.field8 = 2;
    self.field9 = false;
    self.field10 = null;
    self.field11 = Nested{ inner: 42 };
    self.field12 = null;
  }
}
