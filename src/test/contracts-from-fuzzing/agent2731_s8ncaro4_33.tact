struct Deeply {
  x: Int;
}

struct WrapDeep {
  d: Deeply;
}

contract SimpleNested {
  container: WrapDeep;

  init() {
    self.container = WrapDeep{d:Deeply{x:1}};
  }
}