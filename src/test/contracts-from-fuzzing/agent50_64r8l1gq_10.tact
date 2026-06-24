struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract UltraDeepNested {
    v: D;

    init() {
        self.v = D{ c: C{ b: B{ a: A{ x: 123 } } } };
    }
}