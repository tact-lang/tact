struct OptionalNested {
    nested: Int?;
    text: String;
}

struct Container {
    opt: OptionalNested;
    number: Int;
}

contract ComplexNestedStorage {
    field: Container;

    init() {
        self.field = Container{
            opt: OptionalNested{
                nested: 5,
                text: "abc",
            },
            number: 10,
        };
    }
}
