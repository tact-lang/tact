struct Deep {
  a: Int as int64 = 0;
  b: Int as uint8 = 1;
  c: Int?;
  d: Inner;
}

struct Inner {
  x: Int as uint4 = 7;
  y: Bool?;
  z: String?;
}

contract TestContract {
  complex: Deep;

  init() {
    self.complex = Deep{
      c: null,
      d: Inner{ y: null, z: null }
    };
  }
}