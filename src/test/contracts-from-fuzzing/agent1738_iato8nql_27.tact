struct SInt {
  a: Int as uint64;
  b: Int as int128;
}

struct SWrapped {
  inner: SInt;
  opt: Int?;
}

contract TestContract {
  s: SWrapped;

  init() {
    self.s = SWrapped{
      inner: SInt{ a: 123, b: -456 },
      opt: null
    };
  }
}