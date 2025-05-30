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

contract StorageLevels {
    data: D;

    init() {
        self.data = D{ w: C{ z: B{ y: A{ x: 1 } } } };
    }
}
