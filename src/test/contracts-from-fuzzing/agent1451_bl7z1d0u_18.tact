struct OptionalAddress {
  a: Address?;
  b: Address?;
}

contract OptAddrStore {
  data: OptionalAddress;

  init() {
    self.data = OptionalAddress{
      a: null,
      b: null
    };
  }
}
