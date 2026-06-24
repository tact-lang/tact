struct S1 { x: Int }
struct S2 { y: Int }
struct S3 { z: Int }
struct S4 { q: Int }

contract LongList {
  f1: S1;
  f2: S2;
  f3: S3;
  f4: S4;
  f5: Int;
  f6: Bool;
  f7: Int;
  f8: Bool;
  f9: Int;
  f10: Bool;
  f11: Int;

  init() {
    self.f1 = S1{x:1};
    self.f2 = S2{y:2};
    self.f3 = S3{z:3};
    self.f4 = S4{q:4};
    self.f5 = 5;
    self.f6 = true;
    self.f7 = 7;
    self.f8 = false;
    self.f9 = 9;
    self.f10 = true;
    self.f11 = 11;
  }
}