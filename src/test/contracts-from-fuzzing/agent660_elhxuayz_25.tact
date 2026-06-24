struct ManyBoolsAndInt {
  a: Bool;
  b: Bool;
  c: Int;
  d: Bool;
  e: Bool;
}

contract MixBoolIntTest {
  data: ManyBoolsAndInt;

  init() {
    self.data = ManyBoolsAndInt{
      a: true,
      b: false,
      c: 123,
      d: true,
      e: false,
    };
  }
}