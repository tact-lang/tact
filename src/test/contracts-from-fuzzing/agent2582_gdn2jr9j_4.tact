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
    w: C;
}

struct E {
    v: D;
}

struct F {
    u: E;
}

contract Test {
    deep: F;

    init() {
        self.deep = F{
            u: E{
                v: D{
                    w: C{
                        z: B{
                            y: A{
                                x: 123,
                            },
                        },
                    },
                },
            },
        };
    }
}
