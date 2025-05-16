struct OptionalChain3 {
  a: Int?;
  b: Int?;
  c: Int?;
}

contract OptChain3Test {
  data: OptionalChain3;

  init() {
    self.data = OptionalChain3{ a:null, b:null, c:null };
  }
}