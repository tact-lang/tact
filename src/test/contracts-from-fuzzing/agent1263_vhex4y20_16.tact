contract TestContract {
  address2: Address;
  address3: Address;

  init() {
    self.address2 = myAddress();
    self.address3 = myAddress();
  }
}