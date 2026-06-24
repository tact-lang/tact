struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: String;
    b2: A;
}

struct C {
    c1: B;
    c2: A?;
}

contract ChainNest {
    state: C;

    init() {
        self.state = C{
            c1: B{b1: "hi", b2: A{a1: 42, a2: true}},
            c2: null,
        };
    }
}