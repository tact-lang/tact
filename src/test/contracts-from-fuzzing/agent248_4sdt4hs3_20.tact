struct A {
    a1: Int;
}
struct B {
    b1: Int;
}
struct C {
    c1: Int;
}
struct D {
    d1: Int;
}
struct E {
    e1: Int;
}

contract ManyStructs {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;

    init() {
        self.a = A{ a1: 1 };
        self.b = B{ b1: 2 };
        self.c = C{ c1: 3 };
        self.d = D{ d1: 4 };
        self.e = E{ e1: 5 };
    }
}