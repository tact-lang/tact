contract MultiNestedOpts {
    root: Root;

    init() {
        self.root = Root{
            a: "a",
            b: B{
                c: null,
                c2: C{
                    label: "lbl",
                    d: D{
                        flag: true
                    }
                }
            }
        };
    }
}

struct Root {
    a: String;
    b: B;
}

struct B {
    c: C?;
    c2: C;
}

struct C {
    label: String;
    d: D?;
}

struct D {
    flag: Bool;
}
