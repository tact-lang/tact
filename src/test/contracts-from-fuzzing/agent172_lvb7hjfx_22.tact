struct Child {
    a: Int;
}

struct Parent {
    c: Child;
}

contract Test {
    p: Parent = Parent{ c: Child{ a: 2 } };
}