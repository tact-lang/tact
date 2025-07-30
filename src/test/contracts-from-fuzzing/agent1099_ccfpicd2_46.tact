struct Parent {
    x: Int;
}

struct Child {
    p: Parent;
    y: Int;
}

contract NestedFields {
    c: Child;

    init() {
        self.c = Child{
            p: Parent{x:42},
            y: 11
        };
    }
}