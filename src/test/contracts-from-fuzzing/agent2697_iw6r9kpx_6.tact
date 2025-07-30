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
    f: Int;
}

contract LongDeepChain {
    val: A;

    init() {
        self.val = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: 12345,
                        },
                    },
                },
            },
        };
    }
}
