// Multiple structs with nested optionals
struct A {
  b: B?;
}

struct B {
  c: C?;
}

struct C {
  i: Int?;
  str: String?;
}

contract MultiNestOpt {
  data: A;

  init() {
    self.data = A{
      b: B{
        c: C{
          i: null,
          str: null
        }
      }
    };
  }
}