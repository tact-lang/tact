struct MixOrder {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;
  e: Bool?;
  f: String?;
}

contract OrderMixing {
  state: MixOrder;

  init() {
    self.state = MixOrder{
      a:1,b:true,c:null,d:"x",e:null,f:null
    };
  }
}