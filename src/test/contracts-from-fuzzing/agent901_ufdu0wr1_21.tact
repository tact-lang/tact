struct S {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
}

contract TestContract {
  data: S;

  init() {
    self.data = S {
      a:null, b:null, c:null,
      d:null, e:null, f:null
    };
  }
}