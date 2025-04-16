// Large struct with interleaved optionals and nested objects
struct InnerA {
  v1: Int?;
  v2: Bool;
}

struct InnerB {
  flag: Bool?;
  str: String;
}

struct Outer {
  a: InnerA?;
  b: InnerB;
  c: Bool;
  d: String?;
}

contract ComboComplex {
  val: Outer;
  init() {
    self.val = Outer{
      a: null,
      b: InnerB{ flag:null, str:"hi" },
      c: true,
      d: null
    };
  }
}