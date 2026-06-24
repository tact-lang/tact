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

contract MultiStructs {
    x: A;
    y: B;
    z: C;
    w: D;

    init() {
        self.x = A{a1:1};
        self.y = B{b1:2};
        self.z = C{c1:3};
        self.w = D{d1:4};
    }
}
