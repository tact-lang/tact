struct WithLargeInts {
  a: Int as int257;
  b: Int as int256;
  c: Int as uint256;
}

contract TestContract {
  data: WithLargeInts;

  init() {
    self.data = WithLargeInts{
      a: 1,
      b: 2,
      c: 3
    };
  }
}