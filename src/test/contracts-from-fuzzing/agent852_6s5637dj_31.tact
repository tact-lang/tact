struct A { f: Int }
struct B { f: Int }
struct C { f: Int }
struct D { f: Int }

contract ManySameNames {
    a: A;
    b: B;
    c: C;
    d: D;

    init() {
        self.a = A{ f:1 };
        self.b = B{ f:2 };
        self.c = C{ f:3 };
        self.d = D{ f:4 };
    }
}