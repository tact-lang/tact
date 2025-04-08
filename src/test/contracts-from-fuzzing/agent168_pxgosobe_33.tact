struct MixedSerialize {
  a: Int as uint4;
  b: Int as int8;
  c: Int;
  d: Int as uint32;
}

contract TestMixedSerialize {
  f: MixedSerialize;

  init() {
    self.f = MixedSerialize{ a:1,b:2,c:3,d:4 };
  }
}