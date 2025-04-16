struct Rec {
  inner: Int;
  optInner: Int?;
}

contract ManyDefaults {
  s1: Rec = Rec{ inner:0, optInner:null };
  s2: Rec = Rec{ inner:0, optInner:null };
  s3: Rec = Rec{ inner:0, optInner:null };
  s4: Rec = Rec{ inner:0, optInner:null };
  s5: Rec = Rec{ inner:0, optInner:null };
  s6: Rec = Rec{ inner:0, optInner:null };
  s7: Rec = Rec{ inner:0, optInner:null };

  init() {}
}
