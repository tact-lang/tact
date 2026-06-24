struct Big {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String?;
}

contract ManyBigStructs {
 s1: Big;
 s2: Big;
 s3: Big;
 s4: Big;
 s5: Big;
 init() {
  self.s1 = Big{a:1,b:true,c:"a",d:null,e:null,f:null};
  self.s2 = Big{a:2,b:false,c:"b",d:3,e:true,f:"c"};
  self.s3 = Big{a:3,b:true,c:"c",d:null,e:false,f:"d"};
  self.s4 = Big{a:4,b:false,c:"d",d:5,e:null,f:null};
  self.s5 = Big{a:5,b:true,c:"e",d:6,e:true,f:"f"};
 }
}