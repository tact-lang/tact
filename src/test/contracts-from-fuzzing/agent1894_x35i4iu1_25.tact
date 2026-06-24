struct Mix {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String?;
}

contract MixedStorage {
  m1: Mix;
  m2: Mix;

  init() {
    self.m1 = Mix{ a:1,b:true,c:"a",d:null,e:null,f:null };
    self.m2 = Mix{ a:2,b:false,c:"b",d:null,e:null,f:null };
  }
}