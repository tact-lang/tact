struct ManyOptional {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Bool?;
  g: Bool?;
}

contract TestContract {
  m: ManyOptional;

  init() {
    self.m = ManyOptional{
      a:null, b:1, c:null, d:2, e:null, f:true, g:false
    };
  }
}