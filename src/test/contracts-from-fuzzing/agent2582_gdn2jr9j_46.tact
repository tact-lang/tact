struct S {
  a: Int;
  b: Int?;
  c: String?;
}

contract Test {
  one: S;
  two: S;

  init() {
    self.one = S{a:1,b:null,c:null};
    self.two = S{a:2,b:3,c:"hi"};
  }
}
