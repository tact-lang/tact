struct Chained {
  a: Int;
  b: Bool;
}

contract ChainTest {
  f1: Chained;
  f2: Chained;
  f3: Chained;

  init() {
    self.f1 = Chained{ a:1, b:true };
    self.f2 = Chained{ a:2, b:false };
    self.f3 = Chained{ a:3, b:true };
  }
}
