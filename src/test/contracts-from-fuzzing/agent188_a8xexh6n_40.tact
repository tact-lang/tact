struct AAA {
  a: Int;
}

struct BBB {
  b: Int?;
}

struct CCC {
  c: Bool;
}

contract MixStructs {
  f1: AAA;
  f2: BBB;
  f3: CCC;

  init() {
    self.f1 = AAA{a:1};
    self.f2 = BBB{b:null};
    self.f3 = CCC{c:true};
  }
}
