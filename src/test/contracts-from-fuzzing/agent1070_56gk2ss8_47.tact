contract AddressStuff {
  owner: Address;
  admin: Address?;

  init() {
    self.owner = myAddress();
    self.admin = null;
  }
}