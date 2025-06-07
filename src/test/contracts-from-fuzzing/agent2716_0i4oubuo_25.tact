struct IntFields {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
  e: Int;
  f: Int?;
}

contract OptIntMix {
  data: IntFields;

  init() {
    self.data = IntFields{a:1,b:null,c:2,d:null,e:3,f:null};
  }
}