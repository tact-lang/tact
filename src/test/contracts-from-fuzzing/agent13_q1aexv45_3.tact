struct Inner {
  a: Int;
  b: Bool;
  c: Address;
}

contract MultiType {
  data: Inner;

  init() {
    self.data = Inner{a: 7, b: true, c: myAddress()};
  }
}