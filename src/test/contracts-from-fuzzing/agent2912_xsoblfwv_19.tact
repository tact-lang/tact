struct HasAddrStr {
  addr: Address;
  strVal: String;
}

contract AddrStr {
  inner: HasAddrStr;
  init() {
    self.inner = HasAddrStr{ addr: myAddress(), strVal: "hello" };
  }
}