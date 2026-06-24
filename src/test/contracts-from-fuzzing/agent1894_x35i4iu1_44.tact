struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract TenStructs {
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
    self.s1 = S{a:1,b:true,c:"a"};
    self.s2 = S{a:2,b:false,c:"b"};
    self.s3 = S{a:3,b:true,c:"c"};
    self.s4 = S{a:4,b:false,c:"d"};
    self.s5 = S{a:5,b:true,c:"e"};
    self.s6 = S{a:6,b:false,c:"f"};
    self.s7 = S{a:7,b:true,c:"g"};
    self.s8 = S{a:8,b:false,c:"h"};
    self.s9 = S{a:9,b:true,c:"i"};
    self.s10= S{a:10,b:false,c:"j"};
  }
}