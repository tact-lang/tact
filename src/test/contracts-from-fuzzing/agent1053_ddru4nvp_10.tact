struct BigInts {
  a: Int as uint248;
  b: Int as int257;
}

contract WideBits {
  bigs: BigInts;

  init() {
    self.bigs = BigInts{
      a: 1000000000000000000,
      b: -1000000000000000000
    };
  }
}