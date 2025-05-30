struct DeepA {
  v: Int;
}

struct DeepB {
  a: DeepA;
}

struct DeepC {
  b: DeepB;
}

struct DeepD {
  c: DeepC;
}

contract TestContract {
  deep: DeepD;

  init() {
    self.deep = DeepD{ c: DeepC{ b: DeepB{ a: DeepA{ v: 99 } } } };
  }
}