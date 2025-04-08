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
    w: C;
}

contract FourDeep {
    d: D;

    init() {
        self.d = D{ w: C{ z: B{ y: A{ x: 42 } } } };
    }
}