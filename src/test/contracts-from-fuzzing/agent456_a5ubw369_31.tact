struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    ca: A;
    cb: B;
}

contract MultipleNestLevels {
    c: C;

    init() {
        self.c = C {
            ca: A{a:1},
            cb: B{b:2}
        };
    }
}