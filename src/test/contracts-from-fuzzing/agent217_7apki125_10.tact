contract LargeMixed {
  int1: Int;
  int2: Int?;
  int3: Int;
  bool1: Bool;
  bool2: Bool?;
  string1: String;
  string2: String?;

  init() {
    self.int1 = 1;
    self.int2 = null;
    self.int3 = 3;
    self.bool1 = true;
    self.bool2 = null;
    self.string1 = "hello";
    self.string2 = null;
  }
}