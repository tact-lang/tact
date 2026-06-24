struct Simple {
  x: Int;
}

contract List {
  s1: Simple;
  s2: Simple;
  s3: Simple;

  init() {
    self.s1 = Simple{ x:1 };
    self.s2 = Simple{ x:2 };
    self.s3 = Simple{ x:3 };
  }
}