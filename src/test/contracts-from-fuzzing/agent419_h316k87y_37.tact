struct WeirdOpt {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
}

contract DefaultOpts {
  f: WeirdOpt;

  init() {
    self.f = WeirdOpt{ a:null,b:null,c:null };
  }
}