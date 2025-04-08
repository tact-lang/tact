struct OptStruct {
  foo: Int?;
}

contract OptionalContractField {
  field: OptStruct?;

  init() {
    self.field = OptStruct{ foo:null };
  }
}