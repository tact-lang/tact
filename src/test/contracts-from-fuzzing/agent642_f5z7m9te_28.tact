// nested mix with strings, bools optionals
struct SInner {
  a: String?;
  b: Bool?;
  c: Int?;
}

struct SOuter {
  inner1: SInner;
  inner2: SInner?;
}

contract MixedOpt {
  storage: SOuter;
  init() {
    self.storage = SOuter{
      inner1: SInner{ a:null, b:null, c:null },
      inner2: null
    };
  }
}