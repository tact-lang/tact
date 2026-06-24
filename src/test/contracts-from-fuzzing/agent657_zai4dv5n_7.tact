struct OptionalNested {
    nested: Nested?;
}

struct Nested {
    a: Int;
    flag: Bool;
}

contract TestContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            nested: Nested{a: 7, flag: true}
        };
    }
}