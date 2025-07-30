struct StrBoolsInts {
  s: String;
  b: Bool;
  i: Int;
  s2: String?;
  b2: Bool?;
  i2: Int?;
}

contract MixedCrazy {
  f: StrBoolsInts;

  init() {
    self.f = StrBoolsInts{
      s:"S", b:true, i:42, s2:null, b2:null, i2:null
    };
  }
}
