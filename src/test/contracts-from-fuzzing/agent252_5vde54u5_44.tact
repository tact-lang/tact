struct NestedCombo {
  opt: Int?;
  fixed: Int;
  flag: Bool?;
  addr: Address;
}

contract CrossTypesTest {
  data: NestedCombo;

  init() {
    self.data = NestedCombo{
      opt:null,
      fixed:123,
      flag:null,
      addr: myAddress()
    };
  }
}