contract DeepOptionTree {
    root: A;

    init() {
        self.root = A{
            b: B{
                c: null,
                c2: C{
                    label: "lbl",
                    child: null
                }
            }
        };
    }
}

struct A {
    b: B;
}

struct B {
    c: C?;
    c2: C;
}

struct C {
    label: String;
    child: D?;
}

struct D {
    val: Int?;
}
