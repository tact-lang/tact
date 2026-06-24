struct Child {
    n: Int;
    s: String;
}

struct Parent {
    c1: Child;
    c2: Child;
}

contract ParentStructs {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child{ n: 1, s: "a" },
            c2: Child{ n: 2, s: "b" }
        };
    }
}