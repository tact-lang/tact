struct MixedSeq {
  a: Int;
  b: Bool;
  c: Int?;
  d: Int;
  e: Bool?;
  f: Int;
  g: Bool;
  h: Int?;
}

contract MixedOrder {
  data: MixedSeq;

  init() {
    self.data = MixedSeq{
      a:1,b:true,c:null,d:2,e:false,f:3,g:true,h:null
    };
  }
}