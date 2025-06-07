contract BoolIntMix {
  flag1: Bool = true;
  int1: Int = 10;
  flag2: Bool = false;
  int2: Int = 20;

  init() {
    self.flag1 = false;
    self.flag2 = true;
    self.int1 = 100;
    self.int2 = 200;
  }
}
