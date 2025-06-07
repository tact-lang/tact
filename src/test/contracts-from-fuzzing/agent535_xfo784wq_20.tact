struct Large {
  a: Int;
  b: Int;
  c: Int;
  d: Int?;
  e: Bool;
  f: Bool?;
  g: Address?;
  h: String;
}

contract StructMix {
  data: Large;

  init() {
    self.data = Large{
      a:1,b:2,c:3,d:null,e:true,f:null,g:null,h:"x"
    };
  }
}