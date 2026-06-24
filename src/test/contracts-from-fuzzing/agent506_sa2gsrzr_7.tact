struct LargeOptional {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Bool?;
  g: String?;
  h: Address?;
}

contract ManyOptionals {
  state: LargeOptional;

  init() {
    self.state = LargeOptional{
      a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
    };
  }
}