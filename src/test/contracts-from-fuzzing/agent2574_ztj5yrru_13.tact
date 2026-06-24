struct OptInside {
  aa: Int;
  bb: Int?;
}

contract BothKinds {
  f: Int;
  s: OptInside;

  init() {
    self.f = 123;
    self.s = OptInside{ aa: 456, bb: null };
  }
}