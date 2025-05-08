struct AddrStruct {
  owner: Address;
  admin: Address?;
}

contract AddressMix {
  who: AddrStruct;
  init() {
    self.who = AddrStruct{
      owner: myAddress(),
      admin: null,
    };
  }
}