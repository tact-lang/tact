struct OptionInStruct {
  a: Int?;
}

contract TestContract {
  field1: OptionInStruct;
  field2: OptionInStruct;

  init() {
    self.field1 = OptionInStruct{ a: null };
    self.field2 = OptionInStruct{ a: null };
  }
}