struct WithLargeInt {
  a: Int as uint256;
  b: Int as int257;
}

contract LargeInts {
  st: WithLargeInt;

  init() {
    self.st = WithLargeInt{
      a: 123,
      b: -456
    };
  }

  receive() {
    let _ = self.st.b;
  }
}
