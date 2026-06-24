struct DeepNest {
  s1: String?;
  s2: String?;
  s3: String?;
  s4: String?;
  s5: String?;
  s6: String?;
  s7: String?;
  s8: String?;
  s9: String?;
  s10: String?;
}

contract LotsOfOptionals {
  deep: DeepNest;

  init() {
    self.deep = DeepNest{
      s1: "a", s2: null, s3: "c", s4: null, s5: "e",
      s6: null, s7: "g", s8: null, s9: "i", s10: null,
    };
  }
}