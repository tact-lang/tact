struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Container {
  a: A;
  b: B;
  c: C;
}

contract StructsOfStructs {
    v: Container;

    init() {
        self.v = Container{ a: A{ a: 1 }, b: B{ b: 2 }, c: C{ c: 3 } };
    }
}