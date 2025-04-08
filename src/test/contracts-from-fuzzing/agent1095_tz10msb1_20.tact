struct BigS {
  a: Int;
  b: Bool;
  c: String;
  d: Bool?;
  e: Int?;
  f: Address;
  g: String;
  h: Address;
  i: Bool;
  j: Int;
  k: String;
}

contract BigPersistent {
  s1: BigS;
  s2: BigS;

  init() {
    self.s1 = BigS{
      a:1,b:true,c:"a",d:null,e:null,f:myAddress(),g:"b",h:myAddress(),i:false,j:42,k:"c"
    };
    self.s2 = BigS{
      a:2,b:false,c:"x",d:false,e:7,f:myAddress(),g:"y",h:myAddress(),i:true,j:11,k:"z"
    };
  }
}