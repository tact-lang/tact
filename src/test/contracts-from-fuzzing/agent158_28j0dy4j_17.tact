struct Mixed {
  a: Int; 
  b: Bool; 
  c: String; 
  d: Int?;
  e: Bool?;
  f: String?;
}

contract MixStructVar {
  m: Mixed;

  init() {
    self.m = Mixed{
      a:1,
      b:true,
      c:"c",
      d:null,
      e:false,
      f:null
    };
  }
}