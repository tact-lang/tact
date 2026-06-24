// Combining nesting, optionals, defaults, and multiple layers
struct D {
    d1: Int? = null;
}

struct C {
    c1: D;
    c2: Int? = null;
}

struct B {
    b1: C;
    b2: String? = null;
}

struct A {
    a1: B;
    a2: Bool? = null;
}

contract SuperMultiLayerStruct {
    root: A;

    init() {
        self.root = A{
            a1: B{
                b1: C{
                    c1: D{},
                    c2: null,
                },
                b2: null,
            },
            a2: null
        };
    }
}