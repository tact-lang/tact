struct Child {
    a: Int;
    b: Bool;
}

struct Parent {
    c: Int;
    d: Child;
}

contract ComplexDefaults {
    data: Parent = Parent{
        c: 7,
        d: Child{a: 1, b: true}
    };
}