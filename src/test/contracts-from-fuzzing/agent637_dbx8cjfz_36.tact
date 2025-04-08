// variant of previous with optionals on every nested level
struct A { s: String?; }
struct B { a: A?; }
struct C { b: B?; }

contract NestOpt {
  c: C;

  init() {
    self.c = C {
      b: B {
        a: A {
          s: null
        }
      }
    };
  }
}