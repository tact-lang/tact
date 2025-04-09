struct Multi {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
}

contract MixedContract {
  m1: Multi;
  m2: Multi;
  init() {
    self.m1 = Multi{a:1,b:true,c:null,d:false,e:"hi",f:null};
    self.m2 = Multi{a:2,b:false,c:null,d:true,e:"yo",f:null};
  }
}