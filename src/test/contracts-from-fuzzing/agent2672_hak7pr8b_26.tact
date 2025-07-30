struct A { b: B; }

struct B { c: C; }

struct C { d: D; }

struct D { e: E; }

struct E { f: Int; }

contract DeepStruct {
  data: A;

  init() {
    self.data = A {
      b: B {
        c: C {
          d: D {
            e: E {
              f: 42
            }
          }
        }
      }
    };
  }
}