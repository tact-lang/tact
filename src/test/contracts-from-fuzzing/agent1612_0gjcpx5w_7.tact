struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    f: F;
    flag: Bool;
}

struct F {
    x: Int;
}

contract DeepChain {
    chain: A;

    init() {
        self.chain = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{
                                x: 99,
                            },
                            flag: true,
                        },
                    },
                },
            },
        };
    }
}
