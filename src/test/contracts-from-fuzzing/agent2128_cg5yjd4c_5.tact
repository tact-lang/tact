struct Ints {
  a: Int as int8;
  b: Int as int16;
  c: Int as int32;
  d: Int as uint64;
  e: Int as int257;
}

contract IntSerialized {
  data: Ints;

  init() {
    self.data = Ints{
      a: 1,
      b: 2,
      c: 3,
      d: 4,
      e: 5
    };
  }
}