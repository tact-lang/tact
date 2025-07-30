struct D {
    foo: Int;
    bar: String?;
}

struct C {
    d1: D;
    d2: D?;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract DeepMix {
    s: A;

    init() {
        self.s = A{
            b: B{
                c: C{
                    d1: D{
                        foo: 1,
                        bar: null,
                    },
                    d2: null,
                },
            },
        };
    }
}