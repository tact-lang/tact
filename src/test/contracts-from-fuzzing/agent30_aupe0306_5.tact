struct OptionalNested {
    foo: Int?;
    bar: Int;
}

contract OptionalNestedField {
    data: OptionalNested?;

    init() {
        self.data = OptionalNested{
            foo: 123,
            bar: 456
        };
    }
}