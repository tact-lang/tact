struct Pack {
  a: Int as uint4;
  b: Int as uint4;
  c: Int as uint4;
  d: Int as uint4;
}

contract PackedInts {
    bundle: Pack;
    init() {
        self.bundle = Pack{ a:1, b:2, c:3, d:4 };
    }
}