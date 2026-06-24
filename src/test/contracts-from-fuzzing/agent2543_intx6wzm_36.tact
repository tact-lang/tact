struct SPrim {
  a: Int;
  b: Bool;
  c: String;
}

contract SpreadVars {
  aa: Int;
  bb: Bool;
  cc: String;
  s: SPrim;
  init() {
    self.aa =1;
    self.bb =true;
    self.cc ="c";
    self.s = SPrim{ a:2, b:false, c:"d" };
  }
}