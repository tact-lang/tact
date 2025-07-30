struct Rec {
  v1: Int;
  v2: String;
}

contract OverTenFields {
  f1: Int;
  f2: Int;
  f3: Int;
  f4: Int;
  f5: Int;
  f6: Int;
  f7: String;
  f8: String;
  f9: String;
  f10: Rec;
  f11: Rec;

  init() {
    self.f1 = 1;
    self.f2 = 2;
    self.f3 = 3;
    self.f4 = 4;
    self.f5 = 5;
    self.f6 = 6;
    self.f7 = "a";
    self.f8 = "b";
    self.f9 = "c";
    self.f10 = Rec{ v1: 1, v2: "x" };
    self.f11 = Rec{ v1: 2, v2: "y" };
  }
}