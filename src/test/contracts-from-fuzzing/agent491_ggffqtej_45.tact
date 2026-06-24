struct Opts {
  a: Int?;
  b: Bool?;
}

contract OptsAssign {
  s: Opts;

  init() {
    self.s = Opts{ a:null, b:null };
  }
}
