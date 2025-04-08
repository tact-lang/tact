struct Child {
    a: Int;
}

struct Parent {
    ch: Child?;
    b: Int;
}

contract OptionalNestedStructContract {
    parent: Parent;

    init() {
        self.parent = Parent{
            ch: null,
            b: 10,
        };
    }
}