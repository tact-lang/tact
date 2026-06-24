contract StructAddress {
  addr: Address;
  addrOpt: Address?;

  init() {
    self.addr = myAddress();
    self.addrOpt = null;
  }
}