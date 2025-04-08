struct Child {
    a: String;
    b: Int?;
}

struct Parent {
    first: Child;
    second: Child;
    status: Bool;
}

contract NestedStructs {
    stuff: Parent;

    init() {
        self.stuff = Parent{
            first: Child{a:"foo", b: null},
            second: Child{a:"bar", b: 42},
            status: true
        };
    }
}