struct BoolChain5 {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
}

contract BoolStructStorage {
  data: BoolChain5;

  init() {
    self.data = BoolChain5{a:true, b:false, c:true, d:true, e:false};
  }
}