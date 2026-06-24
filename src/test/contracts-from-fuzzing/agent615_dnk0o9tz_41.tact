struct ManyNested {
  foo: Nest1;
}
struct Nest1 { bar: Nest2; }
struct Nest2 { baz: Nest3; }
struct Nest3 { qux: Nest4; }
struct Nest4 { quux: Int; }

contract TestContract {
  m: ManyNested;

  init() {
    self.m = ManyNested {
      foo: Nest1 {
        bar: Nest2 {
          baz: Nest3 {
            qux: Nest4 {
              quux: 42
            }
          }
        }
      }
    };
  }
}