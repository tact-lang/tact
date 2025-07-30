struct S1 {
  f1: Int;
  f2: Bool;
  f3: String?;
}

struct S2 {
  a: S1;
  b: S1;
  c: S1;
}

contract ManyStructs {
  big: S2;
  init() {
    self.big = S2{
      a: S1{ f1:1, f2:true, f3:"A" },
      b: S1{ f1:2, f2:false, f3:null },
      c: S1{ f1:3, f2:true, f3:"C" },
    };
  }
}
