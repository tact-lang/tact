struct ManyOptional {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
}

contract TestContract {
  opt: ManyOptional;

  init() {
    self.opt = ManyOptional{
      a:null, b:null, c:null, d:null, e:null
    };
  }
}