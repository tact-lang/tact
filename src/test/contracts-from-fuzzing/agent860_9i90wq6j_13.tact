contract ManyPrimitives {
  int1: Int = 1;
  int2: Int = 2;
  bool1: Bool = true;
  bool2: Bool = false;
  str1: String = "str1";
  str2: String = "str2";
  intO: Int? = null;
  boolO: Bool? = null;
  strO: String? = null;

  init() {
    self.int1 = 11;
    self.int2 = 22;
    self.bool1 = false;
    self.bool2 = true;
    self.str1 = "hello";
    self.str2 = "world";
    self.intO = 42;
    self.boolO = true;
    self.strO = "optional";
  }
}