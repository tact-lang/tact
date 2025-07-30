struct ManyDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
  d: Int?;
  e: Bool?;
  f: String?;
}

contract DefaultsMix {
  md: ManyDefaults = ManyDefaults{a:5,b:false,c:"def",d:null,e:null,f:null};
}