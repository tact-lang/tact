struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract TestManyOpts {
  opts: ManyOptionals;
  init() {
    self.opts = ManyOptionals{
      a:null, b:true, c:null, d:5, e:null, f:"test"
    };
  }
}
