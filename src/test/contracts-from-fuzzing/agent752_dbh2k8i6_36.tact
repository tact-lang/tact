struct FinalStruct {
  a: Int;
  b: Bool?;
  c: Int = 3;
  d: Bool? = null;
}

contract AllFeatures {
  f: FinalStruct;

  init() {
    self.f = FinalStruct{ a: 5, b: true };
  }
}