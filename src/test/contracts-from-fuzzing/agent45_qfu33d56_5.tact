struct OptionalNested {
    maybeInt: Int?;
}

struct HasNestedOptional {
    field: OptionalNested?;
    value: Int;
}

contract NestedOptionalTest {
    data: HasNestedOptional;

    init() {
        self.data = HasNestedOptional{
            field: null,
            value: 77
        };
    }
}