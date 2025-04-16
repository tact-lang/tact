struct ManyOptional {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
}

contract MultiOptional {
  opts: ManyOptional;

  init() {
    self.opts = ManyOptional{
      a:null,b:null,c:null,d:null,e:null,f:null
    };
  }
}
