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
    val: Int;
}

contract ChainNested {
    field: A;

    init() {
        self.field = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            val: 777,
                        },
                    },
                },
            },
        };
    }
}