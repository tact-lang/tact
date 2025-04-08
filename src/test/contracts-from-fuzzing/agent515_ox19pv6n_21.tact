struct Inner {
  msg: String = "hi";
  check: Bool?;
  count: Int as uint64 = 55;
}

contract Test {
  s: Inner = Inner{};

  receive() {
    let _ = self.s.count;
  }
}