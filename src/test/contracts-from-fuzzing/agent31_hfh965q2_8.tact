struct A { val: Int }
struct B { val: Int }
struct C { val: Int }

struct Nested {
  a: A;
  b: B;
  c: C;
}

contract Test {
  content: Nested;

  init() {
    self.content = Nested{
      a: A{val: 1},
      b: B{val: 2},
      c: C{val: 3}
    };
  }
}