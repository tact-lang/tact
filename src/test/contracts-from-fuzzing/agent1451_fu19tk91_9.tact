contract ManyPrimitives {
  f1: Int = 1;
  f2: Bool = true;
  f3: String = "a";
  f4: Int = 2;
  f5: Bool = false;
  f6: String = "b";
  f7: Int = 3;
  f8: Bool = true;
  f9: String = "c";
  f10: Int = 4;
  f11: Bool = false;
  f12: String = "d";

  receive() {
    self.f1 = self.f1;
  }
}