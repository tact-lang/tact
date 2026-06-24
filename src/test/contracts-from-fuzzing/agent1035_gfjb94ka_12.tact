struct OptionalWide {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
  e: Int?;
  f: Bool?;
  g: Int?;
  h: Bool?;
}

contract OptWideTest {
  data: OptionalWide = OptionalWide{
    a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
  };
  init() {
    self.data = OptionalWide{
      a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:false
    };
  }
  receive() {}
}