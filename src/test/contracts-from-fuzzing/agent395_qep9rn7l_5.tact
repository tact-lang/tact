struct Child {
    value: Int;
}

struct Parent {
    child: Child?;
    label: String;
}

contract OptionalNestedStruct {
    storage: Parent;

    init() {
        self.storage = Parent{
            child: null,
            label: "none"
        };
    }
}
