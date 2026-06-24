struct A {
    flag: Bool;
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

contract DeepFive {
    data: E;

    init() {
        self.data = E{
            nested: D{
                nested: C{
                    nested: B{
                        nested: A{
                            flag: true,
                        },
                    },
                },
            },
        };
    }
}