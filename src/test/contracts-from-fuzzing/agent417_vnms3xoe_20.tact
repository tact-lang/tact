struct Embedded {
  a: Int;
  b: Bool;
}

struct ComplexLayer {
  e1: Embedded;
  e2: Embedded;
  flag: Bool;
}

contract MultiEmbed {
  s: ComplexLayer;

  init() {
    self.s = ComplexLayer{
      e1: Embedded{ a:10, b:true },
      e2: Embedded{ a:20, b:false },
      flag: false
    };
  }
}