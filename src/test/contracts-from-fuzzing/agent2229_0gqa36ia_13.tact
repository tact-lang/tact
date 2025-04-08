struct A {
    i: Int;
}

struct B {
    j: Bool;
}

struct C {
    a: A;
    b: B;
}

contract ChainStructs {
    c: C;

    init() {
        self.c = C{
            a: A{ i: -1 },
            b: B{ j: true }
        };
    }
}
