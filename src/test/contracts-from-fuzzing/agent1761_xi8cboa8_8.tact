struct DeepOptional {
  a: Int?;
  b: InnerOptional;
}

struct InnerOptional {
  c: Int?;
  d: InnerMostOptional;
}

struct InnerMostOptional {
  e: Int?;
}

contract DeepOptTest {
  s: DeepOptional;

  init() {
    self.s = DeepOptional{
      a: null,
      b: InnerOptional{
        c: null,
        d: InnerMostOptional{ e: null }
      }
    };
  }
}