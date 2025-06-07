struct A {
    foo: Int;
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

struct D {
    qux: C;
}

struct E {
    quux: D;
}

struct F {
    corge: E;
}

contract ExtraDeepChain {
    deep: F;

    init() {
        self.deep = F{
            corge: E{
                quux: D{
                    qux: C{
                        baz: B{
                            bar: A{
                                foo: 42,
                            },
                        },
                    },
                },
            },
        };
    }
}