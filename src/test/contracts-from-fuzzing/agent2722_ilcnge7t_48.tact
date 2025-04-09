// test a struct with a mix of optional fields, default fields, nested struct with same

struct Child {
    a: Int?;
    b: Bool = true;
}

struct Parent {
    x: Int = 1;
    y: Bool?;
    c: Child;
}

contract OptionalNestedMixed {
    p: Parent;

    init() {
        self.p = Parent {
            y: null,
            c: Child { a: null }
        };
    }
}