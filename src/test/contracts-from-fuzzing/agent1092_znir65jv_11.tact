struct ManyOptional {
  a: Int?;
  b: Bool?;
  c: Int?;
  d: Bool?;
  e: Int?;
}

contract ManyNulls {
  stuff: ManyOptional;

  init() {
    self.stuff = ManyOptional{
      a:null, b:true, c:null, d:false, e:5
    };
  }
}
