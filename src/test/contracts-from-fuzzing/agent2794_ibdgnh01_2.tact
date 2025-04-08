struct SingleField {
  a: Int;
}

contract ManyFields {
  field1: Int;
  field2: Int?;
  field3: Bool;
  field4: Bool?;
  field5: Cell;
  field6: Cell?;
  field7: Slice;
  field8: Slice?;
  field9: String;
  field10: String?;
  field11: Address;
  field12: Address?;
  field13: SingleField;
  field14: SingleField?;

  init() {
    self.field1 = 1;
    self.field2 = null;
    self.field3 = true;
    self.field4 = null;
    self.field5 = emptyCell();
    self.field6 = null;
    self.field7 = emptyCell().asSlice();
    self.field8 = null;
    self.field9 = "hello";
    self.field10 = null;
    self.field11 = myAddress();
    self.field12 = null;
    self.field13 = SingleField{ a: 123 };
    self.field14 = null;
  }
}