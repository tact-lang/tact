// Struct with many levels of nested optionals
struct A {
  x: Int?;
}

struct B {
  y: A?;
}

struct C {
  z: B?;
}

contract TestNested {
  d: C?;

  init() {
    self.d = C{
      z: B{
        y: A{
          x: 123
        }
      }
    };
  }
}