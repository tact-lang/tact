struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
}

contract TestDeepChain {
    nested: C;

    init() {
        self.nested = C{
            z: 5,
            b: B{ y: 7, a: A{ x: 9 } }
        };
    }
}
