struct InnerAddr {
  addr: Address;
}

contract OptionalStructAddr {
  container: InnerAddr?;

  init() {
    self.container = null;
  }
}