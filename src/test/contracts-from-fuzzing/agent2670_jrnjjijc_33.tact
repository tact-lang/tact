struct Complex {
  a: Int;
  b: Bool?;
  c: String;
  d: InnerComplex;
}

struct InnerComplex {
  e: String?;
  f: Int;
}

contract ComplexNestedOptional {
  cplx: Complex;

  init() {
    self.cplx = Complex{
      a:1,
      b:null,
      c:"test",
      d: InnerComplex{
          e:null,
          f:7
      }
    };
  }
}