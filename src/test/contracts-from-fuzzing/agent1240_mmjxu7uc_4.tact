contract NestedMultiOpt {
    state: A;

    init() {
        self.state = A{
            b: B{
                c: C{
                    label: "lbl",
                    d: null,
                    optInt: 5
                }
            }
        };
    }
}

struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    label: String;
    d: D?;
    optInt: Int?;
}

struct D {
    flag: Bool;
    data: Int?;
}
