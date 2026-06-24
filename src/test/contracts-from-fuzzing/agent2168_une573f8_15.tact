contract AddrInInit {
  a: Address;
  init() {
    self.a = myAddress();
  }
}