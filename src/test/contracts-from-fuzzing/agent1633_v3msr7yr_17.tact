struct S1 { a: Int }
struct S2 { a: Int }
struct S3 { a: Int }
struct S4 { a: Int }
struct S5 { a: Int }
struct S6 { a: Int }
struct S7 { a: Int }
struct S8 { a: Int }
struct S9 { a: Int }
struct S10 { a: Int }

contract ManyStructFields {
  f1: S1;
  f2: S2;
  f3: S3;
  f4: S4;
  f5: S5;
  f6: S6;
  f7: S7;
  f8: S8;
  f9: S9;
  f10: S10;

  init() {
    self.f1 = S1{a:1};
    self.f2 = S2{a:2};
    self.f3 = S3{a:3};
    self.f4 = S4{a:4};
    self.f5 = S5{a:5};
    self.f6 = S6{a:6};
    self.f7 = S7{a:7};
    self.f8 = S8{a:8};
    self.f9 = S9{a:9};
    self.f10= S10{a:10};
  }
}