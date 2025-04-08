contract AddressStuff {
  owner: Address;
  target: Address;
  
  init() {
    self.owner = myAddress();
    self.target = myAddress();
  }
}