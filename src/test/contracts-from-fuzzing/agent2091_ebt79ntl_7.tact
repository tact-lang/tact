struct ComplexOpt {
  s: Slice?;
  str: String?;
}

contract StructComplexOptVar {
  c: ComplexOpt;

  init() {
    self.c = ComplexOpt{s: null, str: null};
  }
}