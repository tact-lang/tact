struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

struct D {
    t: C;
}

contract Test {
    d: D;

    init() {
        self.d = D{ t: C{ z: B{ y: A{ x:1 } } } };
    }
}
