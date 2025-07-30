struct A {
    a: Int;
}

struct B {
    b: Int?;
}

struct C {
    c: A;
    d: B;
    e: Int;
    f: Bool;
}

contract Mix {
    mixed: C;

    init() {
        self.mixed = C{
            c: A{ a: 1 },
            d: B{ b: null },
            e: 7,
            f: false
        };
    }
}