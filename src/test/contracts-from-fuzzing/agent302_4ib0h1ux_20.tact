struct SInner {
  i: Int;
  b: Bool;
}

struct SOut {
  inner1: SInner;
  inner2: SInner;
}

contract MultiNestedStructs {
  d: SOut;

  init() {
    self.d = SOut{
      inner1: SInner{ i:1, b:true },
      inner2: SInner{ i:2, b:false }
    };
  }
}