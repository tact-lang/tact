contract WeirdWidths {
  f1: Int as uint3;
  f2: Int as int12;
  f3: Int as uint1;

  init() {
    self.f1 = 3;
    self.f2 = -100;
    self.f3 = 1;
  }
}