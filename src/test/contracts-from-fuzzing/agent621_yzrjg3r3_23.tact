// Test large number of primitive contract fields
contract PrimitiveOverflow {
  f1: Int;
  f2: Int;
  f3: Bool;
  f4: Int;
  f5: Bool;
  f6: Int;
  f7: Bool;
  f8: Int;
  f9: Bool;
  f10: Int;
  f11: Bool;
  f12: Int;
  f13: Bool;
  f14: Int;
  f15: Bool;
  f16: Int;
  f17: Bool;
  f18: Int;
  f19: Bool;
  f20: Int;

  init() {
    self.f1=1; self.f2=2; self.f3=true; self.f4=4; self.f5=false;
    self.f6=6; self.f7=true; self.f8=8; self.f9=false; self.f10=10;
    self.f11=true; self.f12=12; self.f13=false; self.f14=14; self.f15=true;
    self.f16=16; self.f17=false; self.f18=18; self.f19=true; self.f20=20;
  }
}
