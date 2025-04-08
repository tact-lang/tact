struct Mix {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
}

contract MixFields {
  m: Mix;
  init() {
    self.m = Mix{a:1,b:null,c:true,d:null,e:"x",f:null};
  }
}
