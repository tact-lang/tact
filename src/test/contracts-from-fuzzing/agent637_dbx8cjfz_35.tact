// chain of nested string within struct within struct
struct A { s: String; }
struct B { a: A; }
struct C { b: B; }

contract NestingTest {
  c: C;

  init() {
    self.c = C {
      b: B {
        a: A {
          s: "nested"
        }
      }
    };
  }
}