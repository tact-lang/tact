struct T1 { a: Int }
struct T2 { b: Bool }
struct T3 { c: String }
struct T4 { d: Int? }

contract ManyStructMix {
  s1: T1;
  s2: T2;
  s3: T3;
  s4: T4;

  init() {
    self.s1 = T1{a:10};
    self.s2 = T2{b:true};
    self.s3 = T3{c:"hi"};
    self.s4 = T4{d:null};
  }
}