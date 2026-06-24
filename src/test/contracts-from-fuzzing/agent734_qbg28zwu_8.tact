struct Opts {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract TestContract {
  a: Opts;
  b: Opts;
  c: Opts;

  init() {
    self.a = Opts{ foo:null, bar:true, baz:"A" };
    self.b = Opts{ foo:42, bar:null, baz:null };
    self.c = Opts{ foo:null, bar:null, baz:null };
  }
}