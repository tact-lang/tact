struct A {
    x: Int;
}

struct B {
    a: A;
    b: Int?;
}

struct C {
    b: B;
    z: Bool;
}

struct D {
    c: C;
    s: String;
}

contract VeryDeep {
    state: D;

    init() {
        self.state = D{
            c: C{
                b: B{
                    a: A{ x: 99 },
                    b: null
                },
                z: true
            },
            s: "test"
        };
    }
}