struct OptionalPrimitiveWrap {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
}

contract StructAsOptionalField {
    data: OptionalPrimitiveWrap?;

    init() {
        self.data = OptionalPrimitiveWrap{
            foo: null,
            bar: null,
            baz: null
        };
    }
}