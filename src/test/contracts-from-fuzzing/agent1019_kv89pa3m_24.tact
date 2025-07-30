struct SS1 { x: Int; }
struct SS2 { y: Bool; }
struct SS3 { z: String; }

contract ManyStructs {
  a: SS1;
  b: SS2;
  c: SS3;

  init() {
    self.a = SS1{ x:7 };
    self.b = SS2{ y:false };
    self.c = SS3{ z:"zz" };
  }
}
