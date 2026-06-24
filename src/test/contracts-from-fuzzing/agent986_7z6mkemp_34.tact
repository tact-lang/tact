struct Opt {
  v: Int?;
}

contract ManyOptFields {
  a: Opt;
  b: Opt;
  c: Opt;

  init() {
    self.a = Opt{v:null};
    self.b = Opt{v:null};
    self.c = Opt{v:null};
  }
}