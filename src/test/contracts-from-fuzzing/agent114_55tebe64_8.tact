struct A {
    x: Int;
}

struct B {
    nested: A;
}

struct C {
    nested: B;
}

struct D {
    nested: C;
}

struct E {
    nested: D;
}

contract VeryDeepNestChain {
    x: E;

    init() {
        self.x = E{
            nested: D{
                nested: C{
                    nested: B{
                        nested: A{
                            x: 99,
                        },
                    },
                },
            },
        };
    }
}