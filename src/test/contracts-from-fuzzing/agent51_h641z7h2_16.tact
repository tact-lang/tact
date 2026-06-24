struct A {
    x: Int = 1;
}

struct B {
    y: Int = 2;
}

struct C {
    z: Int = 3;
}

contract Test {
    a: A;
    b: B;
    c: C;
    d: A;
    e: B;
    f: C;

    init() {
        self.a = A{};
        self.b = B{};
        self.c = C{};
        self.d = A{};
        self.e = B{};
        self.f = C{};
    }
}