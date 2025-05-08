struct A {
    x: Int;
}

struct B {
    a: A;
    y: Bool;
}

struct C {
    b: B;
    z: String;
}

struct D {
    c: C;
    w: Int?;
    s: String;
}

contract TestContract {
    data: D;

    init() {
        self.data = D{
            c: C{
                b: B{
                    a: A{x: 11},
                    y: false
                },
                z: "deep"
            },
            w: null,
            s: "done"
        };
    }
}