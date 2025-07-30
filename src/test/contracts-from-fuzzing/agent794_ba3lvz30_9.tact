struct Smaller {
  a: Int as uint8;
  b: Int as int64;
}

struct Bigger {
  s: Smaller;
  c: Int as uint256;
}

contract SerializeFormats {
  data: Bigger;

  init() {
    self.data = Bigger{
      s: Smaller{ a: 255, b: -1000 },
      c: 123456789012345678901234567890
    };
  }
}
