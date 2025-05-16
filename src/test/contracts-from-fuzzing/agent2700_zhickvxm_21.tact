struct A {
  i: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

contract DeepDefaults {
  val: C = C{ b: B{ a: A{ i: 5 } } };

  init() {
    self.val = C{ b: B{ a: A{ i: 42 } } };
  }
}