// Compose of struct with serialized ints + optional
struct Pack {
  a: Int as uint4;
  b: Int as int64;
  opt: Bool?;
}

contract PackTest {
  p: Pack;

  init() {
    self.p = Pack{ a: 9, b: 123456789, opt: null };
  }
}