struct LargeOptional {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
  h: Int?;
}

contract ManyOptionals {
  data: LargeOptional;

  init() {
    self.data = LargeOptional{
      a:null, b:null, c:null, d:null,
      e:null, f:null, g:null, h:null
    };
  }

  receive() {
    let _ = self.data;
  }
}