contract ScalarWithOptionals {
  int1: Int?;
  int2: Int?;
  int3: Int?;

  init() {
    self.int1 = 5;
    self.int2 = null;
    self.int3 = -7;
  }
}
