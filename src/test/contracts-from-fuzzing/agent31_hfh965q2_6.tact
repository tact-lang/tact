contract ManyFields {
  f1: Int = 1;
  f2: Int = 2;
  f3: Int = 3;
  f4: Bool = true;
  f5: Bool = false;
  f6: String = "abc";
  f7: String = "xyz";

  init() {
    self.f1 = 10;
    self.f2 = 20;
    self.f3 = 30;
    self.f4 = false;
    self.f5 = true;
    self.f6 = "foo";
    self.f7 = "bar";
  }
}