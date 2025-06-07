struct A {
    a: Int;
    b: Int?;
}

struct B {
    c: A;
    d: Int;
}

struct C {
    e: B;
    f: Int?;
}

contract ComplexFields {
    data: C;

    init() {
        self.data = C{
            e: B{
                c: A{ a: 1, b: null },
                d: 2
            },
            f: null
        };
    }
}