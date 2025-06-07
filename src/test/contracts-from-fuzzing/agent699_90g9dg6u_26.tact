struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

contract MultiStructs {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A{ a: 1 };
        self.f2 = B{ b: 2 };
        self.f3 = C{ c: 3 };
    }
}