struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct Combined {
  ca: A;
  cb: B;
  cc: C;
}

contract ManyNested {
  storage: Combined;

  init() {
    self.storage = Combined{
      ca: A{a:1},
      cb: B{b:2},
      cc: C{c:3}
    };
  }
}