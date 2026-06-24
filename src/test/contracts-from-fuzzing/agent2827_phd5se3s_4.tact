struct OptionalS {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestOpt {
  foo: OptionalS;
  init() {
    self.foo = OptionalS{a:null, b:true, c:null};
  }
}
