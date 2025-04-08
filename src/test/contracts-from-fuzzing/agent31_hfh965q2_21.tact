struct S {
  a: Int;
  b: Int?;
  c: Bool;
}

contract MultiOpt {
  v1: S;
  v2: S?;

  init() {
    self.v1 = S{a: 1, b: null, c:true};
    self.v2 = null;
  }
}