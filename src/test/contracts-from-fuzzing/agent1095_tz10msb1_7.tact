struct A {
  a: Int;
  b: Int;
}

struct B {
  c: A;
  d: Int;
}

struct C {
  e: B;
  f: Bool;
}

contract NestedOptField {
  big: C?;

  init() {
    self.big = C{
      e: B{
        c: A{
          a: 1,
          b: 2
        },
        d: 3
      },
      f: true
    };
  }
}