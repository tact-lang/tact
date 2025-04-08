struct Tiny {
  flag: Bool;
}

contract ManyFields {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Tiny;
  f5: Int?;
  f6: String;
  f7: Bool?;
  f8: Tiny;
  f9: Int;
  f10: String;

  init() {
    self.f1 = 1;
    self.f2 = false;
    self.f3 = "hi";
    self.f4 = Tiny{ flag: true };
    self.f5 = null;
    self.f6 = "bye";
    self.f7 = true;
    self.f8 = Tiny{ flag: false };
    self.f9 = 999;
    self.f10 = "end";
  }
}