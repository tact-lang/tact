struct Complex {
  a: Int;
  b: Bool;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String;
}

contract BigMix {
  field1: Complex;
  field2: Complex;
  field3: Complex;

  init() {
    self.field1 = Complex{a:1,b:true,c:"x",d:null,e:null,f:"z"};
    self.field2 = Complex{a:2,b:false,c:null,d:5,e:true,f:"y"};
    self.field3 = Complex{a:3,b:true,c:null,d:null,e:false,f:"w"};
  }
}
