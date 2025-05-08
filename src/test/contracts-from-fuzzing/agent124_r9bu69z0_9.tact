struct Child {
    a: Int;
    b: Int;
}

struct Parent {
    c1: Child;
    c2: Child;
}

contract NestedObjects {
    p: Parent;

    init() {
        self.p = Parent{ c1: Child{a: 1, b: 2}, c2: Child{a:3, b:4}};
    }
}