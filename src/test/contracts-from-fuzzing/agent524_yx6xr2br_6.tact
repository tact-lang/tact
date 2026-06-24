struct A {
  v1: Int;
}

struct B {
  v2: A;
}

struct C {
  v3: B;
}

struct D {
  v4: C;
}

contract DeepChain {
  deep: D;

  init() {
    self.deep = D{ v4: C{ v3: B{ v2: A{ v1: 42 } } } };
  }
}