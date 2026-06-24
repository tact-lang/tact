// contract with >20 fields of mixed types and optionals
contract BigMix {
  a1: Int;
  a2: Bool;
  a3: String;
  a4: Int?;
  a5: Bool?;
  a6: String?;
  a7: Int;
  a8: Bool;
  a9: String;
  a10: Int?;
  a11: Bool?;
  a12: String?;
  a13: Int;
  a14: Bool;
  a15: String;
  a16: Int?;
  a17: Bool?;
  a18: String?;
  a19: Int;
  a20: Bool;
  
  init() {
    self.a1 = 1;
    self.a2 = true;
    self.a3 = "a";
    self.a4 = null;
    self.a5 = null;
    self.a6 = null;
    self.a7 = 7;
    self.a8 = false;
    self.a9 = "b";
    self.a10 = null;
    self.a11 = null;
    self.a12 = null;
    self.a13 = 13;
    self.a14 = true;
    self.a15 = "c";
    self.a16 = null;
    self.a17 = null;
    self.a18 = null;
    self.a19 = 19;
    self.a20 = false;
  }
}
