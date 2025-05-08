struct S1 {
  a: Int;
  b: InnerOpt;
}

struct InnerOpt {
  c: Int?;
  d: Bool?;
}

contract OptInnerStruct {
  s: S1;

  init() {
    self.s = S1{
      a: 1,
      b: InnerOpt{ c:null, d:true }
    };
  }
}