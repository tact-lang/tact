struct D {
    d1: Int?;
    d2: Bool;
}

struct C {
    c1: String;
    c2: D;
    c3: Bool?;
}

struct B {
    b1: Int;
    b2: C;
}

struct A {
    a1: Bool;
    a2: B;
    a3: String?;
}

contract TestContract {
    val: A = A{
        a1: true,
        a2: B{
            b1: 7,
            b2: C{
                c1: "hello",
                c2: D{ d1: null, d2: true },
                c3: false
            }
        },
        a3: "hi"
    };
    init() {}
}