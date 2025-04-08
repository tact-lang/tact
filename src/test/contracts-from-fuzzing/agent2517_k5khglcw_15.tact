struct Mix {
  a: Int as int64;
  b: Int as uint8;
  c: Int as uint256;
  d: Int as int1;
  e: Int as uint4;
  f: Int as int257;
}

contract Test {
  m: Mix;

  init() {
    self.m = Mix{
      a: 1,
      b: 2,
      c: 3,
      d: 0,
      e: 4,
      f: 5,
    };
  }
}