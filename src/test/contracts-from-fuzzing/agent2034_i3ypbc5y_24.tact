struct WithAddr {
  a: Address;
}

contract AddrHolder {
  av: WithAddr;

  init() {
    self.av = WithAddr{ a: myAddress() };
  }
}