struct Alpha {
  a: Int;
}
struct Beta {
  b: Int;
}
struct Gamma {
  g: Int;
}

contract StructFieldsMix {
  a: Alpha;
  b: Beta;
  g: Gamma;

  init() {
    self.a = Alpha{a:1};
    self.b = Beta{b:2};
    self.g = Gamma{g:3};
  }
}