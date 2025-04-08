struct LargeOptional {
  a: Int?; b: Int?; c: Int?; d: Int?;
  e: Int?; f: Int?; g: Int?; h: Int?;
}

contract Test {
  data: LargeOptional;

  init() {
    self.data = LargeOptional{
      a:null,b:1,c:null,d:2,e:null,f:3,g:null,h:4,
    };
  }
}
