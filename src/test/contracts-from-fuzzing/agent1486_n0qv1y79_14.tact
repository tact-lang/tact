struct Child {
    x: Int?;
    y: Bool? = true;
}

struct Parent {
    val: Int;
    nested: Child;
}

contract NestedDefaults {
    storage: Parent;

    init() {
        self.storage = Parent{
            val: 5,
            nested: Child{
                x: null,
            },
        };
    }
}