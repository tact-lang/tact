struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract NestedAssign {
    storage: C;

    init() {
        self.storage = C{ z: B{ y: A{ x: 77 } } };
    }
}