struct A {
    a1: Int;
    a2: String;
}

struct B {
    b1: Bool;
    b2: A;
}

struct C {
    c1: B;
    c2: String;
}

contract TestContract {
    composite: C;

    init() {
        self.composite = C{
            c1: B{
                b1: true,
                b2: A{a1: 123, a2: "hello"}
            },
            c2: "world"
        };
    }
}