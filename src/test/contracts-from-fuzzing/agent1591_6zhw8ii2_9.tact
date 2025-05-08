struct A {
    value: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract ChainNested {
    d: D;

    init() {
        self.d = D{c: C{b: B{a: A{value: 123}}}};
    }

    receive() {
        self.d = self.d;
    }
}