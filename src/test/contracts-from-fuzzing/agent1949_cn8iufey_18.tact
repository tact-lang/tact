struct Weird {
  a: Int as uint32;
  b: Int;
  c: Int as int16;
  d: Int;
  e: Int as uint8;
}

contract SerializeMixTest {
  s: Weird;

  init() {
    self.s = Weird{
      a: 1, b: 2, c: -3, d: 4, e: 5
    };
  }
}
