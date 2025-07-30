struct S1 {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;
  e: Bool?;
  f: String;
}

contract ManyFields {
  s: S1;

  init() {
    self.s = S1{a:1,b:true,c:null,d:"hi",e:false,f:"yo"};
  }
}