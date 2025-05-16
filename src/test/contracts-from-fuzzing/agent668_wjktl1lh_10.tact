struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }
struct F { e: E; }

contract TestContract {
  deep: F;

  init() {
    self.deep = F {
      e: E {
        d: D {
          c: C {
            b: B {
              a: A {
                x: 1,
              },
            },
          },
        },
      },
    };
  }
}