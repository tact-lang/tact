struct A {
    b: B;
    name: String;
}

struct B {
    c: C;
    flag: Bool;
}

struct C {
    d: D;
    number: Int;
}

struct D {
    text: String;
    maybe: Int?;
}

contract TestChain {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        text: "deep",
                        maybe: null,
                    },
                    number: 7,
                },
                flag: true,
            },
            name: "root",
        };
    }
}
