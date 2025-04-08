struct Child {
    flag: Bool;
    info: String;
}

struct Parent {
    number: Int;
    nested: Child;
}

contract OptionalNestedComposite {
    data: Parent?;

    init() {
        self.data = null;
    }
}