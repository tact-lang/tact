struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: A;
    b2: Int?;
}

struct C {
    c1: B;
    c2: String;
}

contract Test {
    c: C = C{
        c1: B{
            b1: A{
                a1: 7,
                a2: false
            },
            b2: null
        },
        c2: "hello"
    };

    init() {}
}