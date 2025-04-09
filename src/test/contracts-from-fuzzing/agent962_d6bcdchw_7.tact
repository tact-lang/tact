struct S {
  f1: Int;
  f2: Bool;
  f3: String;
}

contract LargeList {
  s1: S;
  s2: S;
  s3: S;
  s4: S;
  s5: S;
  s6: S;
  s7: S;
  s8: S;
  s9: S;
  s10: S;

  init() {
    self.s1 = S{ f1:1, f2:true, f3:"a" };
    self.s2 = S{ f1:2, f2:false, f3:"b" };
    self.s3 = S{ f1:3, f2:true, f3:"c" };
    self.s4 = S{ f1:4, f2:false, f3:"d" };
    self.s5 = S{ f1:5, f2:true, f3:"e" };
    self.s6 = S{ f1:6, f2:false, f3:"f" };
    self.s7 = S{ f1:7, f2:true, f3:"g" };
    self.s8 = S{ f1:8, f2:false, f3:"h" };
    self.s9 = S{ f1:9, f2:true, f3:"i" };
    self.s10 = S{ f1:10, f2:false, f3:"j" };
  }
}