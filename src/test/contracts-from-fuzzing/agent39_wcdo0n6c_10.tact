struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    a: A;
    b: B;
}

contract TestContract {
    composite: C;

    init() {
        self.composite = C{
            a: A{ x: 11 },
            b: B{ y: 22 }
        };
    }
}