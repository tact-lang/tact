struct OptionalInNested {
    val: Int?;
}

struct Container {
    nested: OptionalInNested;
}

contract OptionalNestedContract {
    field: Container;

    init() {
        self.field = Container{
            nested: OptionalInNested{
                val: null,
            },
        };
    }
}