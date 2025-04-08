struct SDeep {
  a: Int?;
  b: Bool; 
  c: InnerDeep;
}

struct InnerDeep {
  d: Int;
  e: String?;
}

contract DeepOptionalNest {
  s: SDeep;

  init() {
    self.s = SDeep{
      a: null,
      b: false,
      c: InnerDeep{
        d: 1,
        e: null
      }
    };
  }
}