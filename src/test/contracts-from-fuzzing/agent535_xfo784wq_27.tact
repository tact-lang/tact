struct TestStruct {
  addr: Address?;
}

contract OptAddressField {
  s: TestStruct;

  init() {
    self.s = TestStruct{addr: null};
  }
}