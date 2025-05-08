struct ComplexOptionals {
  o1: Int?;
  o2: InnerOpt?;
}

struct InnerOpt {
  x: Int?;
  y: Bool;
}

contract OptCombo {
  c: ComplexOptionals;

  init() {
    self.c = ComplexOptionals{ o1:null, o2:null };
  }
}