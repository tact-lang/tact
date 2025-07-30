struct Formats {
  a: Int as int64;
  b: Int as uint32;
  c: Int;
  d: Int as uint8;
}

contract SerialTest {
  val: Formats;

  init() {
    self.val = Formats{
      a: -1000,
      b: 1000,
      c: 123456789,
      d: 255
    };
  }
}