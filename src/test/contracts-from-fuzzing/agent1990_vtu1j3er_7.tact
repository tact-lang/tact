struct A {
  x: Int;
}

struct B {
  y: Int;
}

struct C {
  a: A;
  b: B;
  optA: A?;
  optB: B?;
}

contract OptionalNested {
  inner: C;

  init() {
    self.inner = C{
      a: A{ x: 1 },
      b: B{ y: 2 },
      optA: null,
      optB: null
    };
  }
}
