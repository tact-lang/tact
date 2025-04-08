struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    embeddedA: A;
    embeddedB: B;
}

contract TestContract {
    complex: C;

    init() {
        self.complex = C{
            embeddedA: A{x:5},
            embeddedB: B{y:10}
        };
    }
}