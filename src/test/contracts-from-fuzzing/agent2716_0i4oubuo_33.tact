struct BigMix {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
  g: Int;
  h: Bool;
  i: Int?;
  j: Bool?;
  k: String;
  l: String?;
}

contract BigMixTest {
  data: BigMix;
  init() {
    self.data = BigMix{
      a:1,b:true,c:null,d:false,e:"E",f:null,
      g:2,h:false,i:null,j:true,k:"K",l:null
    };
  }
}