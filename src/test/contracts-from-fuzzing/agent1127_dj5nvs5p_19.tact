struct Ints {
  a: Int as int64;
  b: Int as uint32;
  c: Int as uint8;
}

contract SerializationOversize {
  data: Ints;

  init() {
    self.data = Ints{
      a: 1,
      b: 2,
      c: 3,
    };
  }
}
