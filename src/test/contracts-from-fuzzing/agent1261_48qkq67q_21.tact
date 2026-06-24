struct ManyOptional {
  a: Int?; b: Int?; c: Int?;
  d: Bool?; e: Bool?; f: Bool?;
  g: String?; h: String?; i: String?;
}

contract MegaOptionals {
  m: ManyOptional;

  init() {
    self.m = ManyOptional{
      a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null
    };
  }
}