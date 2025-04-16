struct ContractInStruct {
  foo: Int;
}

contract ContractFields {
  s: ContractInStruct;

  init() {
    self.s = ContractInStruct{foo: 7};
  }
}
