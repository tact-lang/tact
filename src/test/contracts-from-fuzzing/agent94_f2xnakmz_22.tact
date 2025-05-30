struct Base {
  a: Int;
}

struct Wrap1 {
  base: Base;
}

struct Wrap2 {
  wrap1: Wrap1;
}

contract StructWrapChain {
  data: Wrap2;

  init() {
    self.data = Wrap2{ wrap1: Wrap1{ base: Base{ a: 42 } } };
  }
}