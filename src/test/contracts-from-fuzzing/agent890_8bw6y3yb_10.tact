struct A { x: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }

contract Test {
    a: A;
    b: B;
    c: C;
    d: D;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ a: self.a };
        self.c = C{ b: self.b };
        self.d = D{ c: self.c };
    }
}