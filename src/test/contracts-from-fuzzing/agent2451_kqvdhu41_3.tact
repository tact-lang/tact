struct Nested {
    value: Int;
    flag: Bool;
}

struct Container {
    nested: Nested;
    label: String;
    optionalValue: Int?;
}

contract TestNested {
    field: Container;

    init() {
        self.field = Container{
            nested: Nested{ value: 7, flag: true },
            label: "hello",
            optionalValue: null,
        };
    }
}