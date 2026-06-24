struct OptionalAddressStruct {
  addr: Address?;
}

contract OptionalAddressTest {
  s: OptionalAddressStruct;

  init() {
    self.s = OptionalAddressStruct{ addr:null };
  }
}