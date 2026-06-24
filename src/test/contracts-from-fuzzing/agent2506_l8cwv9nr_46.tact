// Persistent state optional primitive + deep nested struct
struct D {
  x: Int;
}

struct C {
  d: D;
}

struct B {
  c: C;
}

struct A {
  b: B;
}

contract DeepLayered {
  foo: Int?;
  nested: A;
  init() {
    self.foo = null;
    self.nested = A{
      b: B{
        c: C{
          d: D{
            x: 11,
          },
        },
      },
    };
  }
}
