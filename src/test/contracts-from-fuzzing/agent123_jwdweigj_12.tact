struct OptionalNested {
    foo: Int?;
    bar: Bool?;
}

contract NullableEmbedded {
    s: OptionalNested?;

    init() {
        self.s = OptionalNested{
            foo: null,
            bar: null
        };
    }
}