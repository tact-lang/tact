struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

struct D {
    q: C;
}

struct E {
    r: D;
}

contract SuperDeep {
    payload: E;

    init() {
        self.payload = E {
            r: D {
                q: C {
                    z: B {
                        y: A {
                            x: 42,
                        },
                    },
                },
            },
        };
    }
}