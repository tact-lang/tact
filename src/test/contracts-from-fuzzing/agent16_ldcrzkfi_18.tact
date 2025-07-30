struct OptionalInNested {
    subInt: Int?;
    subBool: Bool?;
}

struct Container {
    nested: OptionalInNested;
    val: Int;
}

contract OptionalNestedFields {
    field: Container;

    init() {
        self.field = Container{
            nested: OptionalInNested{ subInt: null, subBool: null },
            val: 42
        };
    }
}