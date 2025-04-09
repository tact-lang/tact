struct Ints {
  a: Int as int64;
  b: Int as uint32;
  c: Int as uint8;
  d: Int as int128;
}

contract SerializedInts {
  data: Ints;

  init() {
    self.data = Ints{
      a: 10,
      b: 20,
      c: 30,
      d: 40
    };
  }
}
