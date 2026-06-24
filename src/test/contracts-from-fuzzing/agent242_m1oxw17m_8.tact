struct NestedAddress {
  a1: Address;
  a2: Address;
}

struct DeepAddresses {
  a: Address;
  nested: NestedAddress;
}

contract AddressStore {
  addrData: DeepAddresses;

  init() {
    self.addrData = DeepAddresses{
      a: myAddress(),
      nested: NestedAddress{
        a1: myAddress(),
        a2: myAddress(),
      },
    };
  }
}