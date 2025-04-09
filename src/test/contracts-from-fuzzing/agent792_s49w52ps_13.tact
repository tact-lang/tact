struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    a: A;
    b: B;
    ca: A;
    cb: B;
}

contract NestedMulti {
    f: C;

    init() {
        self.f = C{
            a: A{a:1},
            b: B{b:2},
            ca: A{a:3},
            cb: B{b:4}
        };
    }
}