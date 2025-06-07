struct S1 { f1: Int }
struct S2 { f2: Int }
struct S3 { f3: Int }
struct S4 { f4: Int }
struct S5 { f5: Int }
struct S6 { f6: Int }
struct S7 { f7: Int }
struct S8 { f8: Int }
struct S9 { f9: Int }
struct S10 { f10: Int }

contract TestContract {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
  s5: S5;
  s6: S6;
  s7: S7;
  s8: S8;
  s9: S9;
  s10: S10;

  init() {
    self.s1 = S1{f1: 1};
    self.s2 = S2{f2: 2};
    self.s3 = S3{f3: 3};
    self.s4 = S4{f4: 4};
    self.s5 = S5{f5: 5};
    self.s6 = S6{f6: 6};
    self.s7 = S7{f7: 7};
    self.s8 = S8{f8: 8};
    self.s9 = S9{f9: 9};
    self.s10 = S10{f10: 10};
  }
}