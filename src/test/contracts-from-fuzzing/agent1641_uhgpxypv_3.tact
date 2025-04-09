struct A {
    a: Int;
}

struct B {
    b1: Bool;
    b2: A;
}

struct C {
    c1: Int;
    c2: B;
    c3: Bool?;
}

contract TestContract {
    dat: C;

    init() {
        self.dat = C{
            c1: 10,
            c2: B{b1: false, b2: A{a: 1}},
            c3: true
        };
    }
}