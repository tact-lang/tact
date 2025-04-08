struct Three {
  a: Int;
  b: Int?;
  c: Int;
}

contract MiddleOpt {
  f: Three;
  init() {
    self.f = Three{ a:1, b:null, c:3 };
  }
}