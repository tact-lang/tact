struct S {
  a: Int;
  b: Bool;
  c: Int?;
}

contract MultiVars {
  f1: S;
  f2: S?;

  init() {
    self.f1 = S{a:1,b:true,c:null};
    self.f2 = null;
  }
}