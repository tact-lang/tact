struct GrandChild {
    a: Int;
}
struct Child {
    g: GrandChild;
    og: GrandChild?;
}

struct Parent {
    c: Child;
    oc: Child?;
}

contract NestedNullable {
    p: Parent;

    init() {
        self.p = Parent{
            c: Child{
                g: GrandChild{a:1},
                og: null,
            },
            oc: null,
        };
    }
}
