struct Mix {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Address;
  f: Address?;
  g: String;
  h: String?;
}

contract NestedMixes {
  m1: Mix;
  m2: Mix;

  init() {
    self.m1 = Mix{a:1,b:null,c:true,d:null,e:myAddress(),f:null,g:"hi",h:null};
    self.m2 = Mix{a:2,b:42,c:false,d:true,e:myAddress(),f:myAddress(),g:"yo",h:null};
  }
}