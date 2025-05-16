contract OptionalAddressFields {
  admin: Address?;
  owner: Address;

  init() {
    self.admin = null;
    self.owner = myAddress();
  }
}