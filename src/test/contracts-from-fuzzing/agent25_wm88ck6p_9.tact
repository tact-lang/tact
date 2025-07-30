struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    aField: A;
    bField: B;
}

contract TestContract {
    composite: C;

    init() {
        self.composite = C{
            aField: A{ x: 1 },
            bField: B{ y: 2 },
        };
    }
}