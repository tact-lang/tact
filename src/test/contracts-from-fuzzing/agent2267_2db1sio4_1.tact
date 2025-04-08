struct Nested {
  nestedField: Int;
}

contract WideContract {
  field1: Int;
  field2: Bool;
  field3: String;
  field4: Cell;
  field5: Slice;
  field6: Address;
  field7: Int?;
  field8: Bool?;
  field9: String?;
  field10: Cell?;
  field11: Slice?;
  field12: Address?;
  nested: Nested;

  init() {
    self.field1 = 1;
    self.field2 = true;
    self.field3 = "a";
    self.field4 = emptyCell();
    self.field5 = self.field4.asSlice();
    self.field6 = myAddress();
    self.field7 = 123;
    self.field8 = false;
    self.field9 = null;
    self.field10 = null;
    self.field11 = null;
    self.field12 = null;
    self.nested = Nested{nestedField: 42};
  }
}
