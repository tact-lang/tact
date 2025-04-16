struct Child {
    c1: Int;
    c2: Bool;
    c3: String;
}

struct Parent {
    p1: Int;
    p2: Bool;
    childField: Child;
}

contract DeepNested {
    deep: Parent;

    init() {
        self.deep = Parent{
            p1: 1,
            p2: false,
            childField: Child{
                c1: 2,
                c2: true,
                c3: "xyz",
            },
        };
    }
}