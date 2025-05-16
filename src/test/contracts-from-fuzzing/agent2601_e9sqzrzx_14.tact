struct A {
    value: Int;
}

struct B {
    a: A;
    bval: Int;
}

struct C {
    b: B;
    cval: Int;
}

struct D {
    c: C;
    dval: Int;
}

contract DeepChain {
    data: D;
    init() {
        self.data = D{ c: C{ b: B{ a: A{ value: 5 }, bval:6 }, cval:7 }, dval:8 };
    }
}