struct S {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
}

contract TestContract {
  s1: S;
  s2: S;

  init() {
    self.s1 = S { a:1, b:null, c:3, d:null };
    self.s2 = S { a:10, b:20, c:30, d:40 };
  }
}