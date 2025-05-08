struct Complex {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
}

struct Holder {
  first: Complex;
  second: Complex;
}

contract ManyComplexFields {
  data: Holder;

  init() {
    self.data = Holder{
      first: Complex{
        a:1,b:true,c:null,d:false,e:2,f:true,g:3,h:null
      },
      second: Complex{
        a:4,b:false,c:5,d:true,e:6,f:false,g:null,h:true
      }
    };
  }
}
