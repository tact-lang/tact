contract LongFields {
  a0: Int = 0;
  a1: Int = 1;
  a2: Int = 2;
  a3: Int = 3;
  a4: Int = 4;
  a5: Int = 5;
  a6: Int = 6;
  a7: Int = 7;
  a8: Int = 8;
  a9: Int = 9;
  b: Bool = true;
  s: String = "s";
  flag: Bool? = null;

  init() {
    self.a0 = 10;
  }

  receive() {
    self.a0 = self.a0 + 1;
  }
}