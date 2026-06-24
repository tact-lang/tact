struct SOpt {
  a: Int?;
  b: Int?;
}

struct SIn {
  sopt: SOpt;
  c: Int;
}

contract OptNestedTest {
  st: SIn;
  init() {
    self.st = SIn{ sopt: SOpt{ a:null, b:null }, c:7 };
  }
}