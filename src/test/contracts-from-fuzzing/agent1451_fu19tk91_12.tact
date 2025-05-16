struct OptStrAddr {
  s: String?;
  a: Address?;
}

contract OptAddrStrTest {
  data: OptStrAddr = OptStrAddr{
    s: null,
    a: null,
  };

  receive() {
    self.data = self.data;
  }
}