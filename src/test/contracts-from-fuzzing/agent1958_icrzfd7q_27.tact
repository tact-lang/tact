struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract AssignAll {
    f: C;

    init() {
        self.f = C{ z: B{ y: A{ x:123 } } };
    }
}
