struct A {
    f1: Int;
    f2: B;
}

struct B {
    f3: C;
}

struct C {
    f4: D;
}

struct D {
    f5: Int;
    f6: E?;
}

struct E {
    f7: Bool;
}

contract VeryDeep {
    data: A;

    init() {
        self.data = A{
            f1: 1,
            f2: B{
                f3: C{
                    f4: D{
                        f5: 2,
                        f6: null,
                    },
                },
            },
        };
    }
}
