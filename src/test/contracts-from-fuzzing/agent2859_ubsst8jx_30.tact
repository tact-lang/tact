struct Big {
  a: Int;
  b: Bool;
  c: Address;
  d: String;
  e: Int?;
  f: Bool?;
  g: Address?;
  h: String?;

  i: Int;
  j: Bool;
  k: Address;
  l: String;
  m: Int?;
  n: Bool?;
  o: Address?;
  p: String?;
}

contract ManyMix {
  data: Big;

  init() {
    self.data = Big{
      a:1,b:true,c:myAddress(),d:"hi",
      e:null,f:null,g:null,h:null,
      i:2,j:false,k:myAddress(),l:"ok",
      m:null,n:true,o:null,p:"test"
    };
  }
}