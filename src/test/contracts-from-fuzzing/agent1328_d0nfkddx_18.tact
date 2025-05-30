struct Child {
    name: String;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
}

contract Family {
    p: Parent;
    init() {
        self.p = Parent{
            c1: Child{ name: "A" },
            c2: Child{ name: "B" },
            c3: Child{ name: "C" },
        };
    }
}