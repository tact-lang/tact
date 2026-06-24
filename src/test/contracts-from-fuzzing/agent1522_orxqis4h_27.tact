struct Ints {
  a: Int;
  b: Int as uint8;
  c: Int as int256;
  d: Int as uint64;
  e: Int as int8;
}

contract SerializedInts {
  data: Ints;

  init() {
    self.data = Ints{
      a: 1,
      b: 2,
      c: 3,
      d: 4,
      e: 5,
    };
  }

  receive() {
    let _ = self.data;
  }
}