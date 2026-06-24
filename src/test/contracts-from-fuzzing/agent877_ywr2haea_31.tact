// A large contract with nested structs and lots of fields
struct SubData {
  x: Int;
  y: String;
  z: Bool?;
}

struct SubOpt {
  inner: SubData?;
}

contract BigMix {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
  f: Bool?;
  g: SubData;
  h: SubOpt;
  i: SubOpt?;
  j: SubData?;

  init() {
    self.a = 1;
    self.b = "hello";
    self.c = false;
    self.d = null;
    self.e = null;
    self.f = true;
    self.g = SubData{ x: 10, y: "sub", z: null };
    self.h = SubOpt{ inner: null };
    self.i = null;
    self.j = null;
  }
}