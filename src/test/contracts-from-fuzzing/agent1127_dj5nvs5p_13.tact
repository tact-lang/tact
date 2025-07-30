struct A {
  b: B?;
}
struct B {
  c: C?;
}
struct C {
  d: D?;
}
struct D {
  e: E?;
}
struct E {
  f: Int?;
}

contract DeepOptional {
  rec: A;

  init() {
    self.rec = A{
      b: B{
        c: C{
          d: D{
            e: E{
              f: null,
            },
          },
        },
      },
    };
  }
}
