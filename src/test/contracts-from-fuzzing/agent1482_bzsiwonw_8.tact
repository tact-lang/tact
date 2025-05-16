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
    data: C;

    init() {
        self.data = C{
            a: A{ x: 5 },
            b: B{ y: 7 },
        };
    }
}