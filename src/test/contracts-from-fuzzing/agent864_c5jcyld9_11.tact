struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: A;
    d: B;
}

contract TestContract {
    nestedAB: C;

    init() {
        self.nestedAB = C{
            c: A{ a:11 },
            d: B{ b:22 }
        };
    }
}