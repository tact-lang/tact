struct BoolOptional {
  a: Bool;
  b: Int?;
  c: Bool;
  d: Int?;
}

contract InterleavedTest {
  s: BoolOptional;

  init() {
    self.s = BoolOptional{
      a:true,
      b:null,
      c:false,
      d:null
    };
  }
}