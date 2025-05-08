struct A {
    v: Int;
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

contract DeepChain {
    d: D;

    init() {
        self.d = D{ c: C{ b: B{ a: A{ v:42 } } } };
    }
}