struct A {
    x: Int;
}

struct B {
    y: Int?;
}

struct C {
    z: B;
}

struct D {
    q: C;
    w: A;
}

contract WideAndDeep {
    storage: D;

    init() {
        self.storage = D{
            q: C{ z: B{ y: null } },
            w: A{ x: 42 }
        };
    }
}