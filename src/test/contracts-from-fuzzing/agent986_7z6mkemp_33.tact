struct MixedDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "";
  d: Int?;
  e: Bool?;
  f: String?;
}

contract DefaultsComplex {
  m: MixedDefaults;

  init() {
    self.m = MixedDefaults{ a:2, b:true, c:"hi", d:null, e:null, f:null };
  }
}