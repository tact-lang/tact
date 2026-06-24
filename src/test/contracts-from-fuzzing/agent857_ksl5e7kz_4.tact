struct D {
    flag: Bool;
    level: Int;
}

struct C {
    d: D;
    status: Int;
}

struct B {
    c: C;
    description: String;
}

struct A {
    b: B;
    id: Int;
}

contract TestContract {
    record: A = A{
        b: B{
            c: C{
                d: D{ flag: false, level: 0 },
                status: 0
            },
            description: ""
        },
        id: 0
    };
}