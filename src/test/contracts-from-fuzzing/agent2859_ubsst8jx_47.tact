// Mix of serialized int sizes and nested structures
struct Sub {
  a: Int as uint32;
  b: Int as int16;
}

struct Outer {
  s: Sub;
  c: Int as uint64;
}

contract MixedNestSerial {
  f: Outer;

  init() {
    self.f = Outer{ s: Sub{ a:1,b:-2},c:3 };
  }
}