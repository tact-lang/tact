struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct Wrap {
  a: A;
  b: B;
  c: C;
  optStr: String?;
}

contract ManyNestedOpt {
  data: Wrap;

  init() {
    self.data = Wrap{
      a: A{ a: 1 },
      b: B{ b: 2 },
      c: C{ c: 3 },
      optStr: null
    };
  }
}