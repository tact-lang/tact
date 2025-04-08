struct Mixed {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract TestMixed {
  mix: Mixed;

  init() {
    self.mix = Mixed{a:1,b:true,c:"x",d:null,e:null,f:null};
  }
}