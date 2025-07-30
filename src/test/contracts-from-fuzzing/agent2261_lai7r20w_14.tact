contract WideNullableInts {
  a: Int? as uint8;
  b: Int? as int16;
  c: Int? as uint32;
  d: Int? as int64;
  e: Int? as uint128;
  f: Int?;
  g: Int? as int8;
  h: Int? as uint16;
  i: Int? as int32;
  j: Int? as uint64;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.d = null;
    self.e = null;
    self.f = null;
    self.g = null;
    self.h = null;
    self.i = null;
    self.j = null;
  }
}