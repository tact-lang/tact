struct Child1 {
    i: Int;
}

struct Child2 {
    s: String;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract MultiChainNested {
    f: Parent;

    init() {
        self.f = Parent{
            c1: Child1{ i: 1 },
            c2: Child2{ s: "text" }
        };
    }
}
