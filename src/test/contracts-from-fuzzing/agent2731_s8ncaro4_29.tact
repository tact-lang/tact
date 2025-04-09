struct AAA {
  a: Int;
}
struct BBB {
  b: String;
}
struct CCC {
  c: Bool;
}
struct DDD {
  d: Int?;
}

contract ManyNestedKinds {
  aa: AAA;
  bb: BBB;
  cc: CCC;
  dd: DDD;

  init() {
    self.aa=AAA{a:1};
    self.bb=BBB{b:"hi"};
    self.cc=CCC{c:true};
    self.dd=DDD{d:null};
  }
}