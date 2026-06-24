struct Innermost {
  x: Int?;
  y: Int?;
}

struct Middle {
  inner1: Innermost?;
  inner2: Innermost?;
}

struct Outer {
  m1: Middle?;
  m2: Middle?;
}

contract OptionalNestComplex {
  o: Outer;

  init() {
    self.o = Outer {
      m1: null,
      m2: null
    };
  }
}