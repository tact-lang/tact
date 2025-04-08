struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    quux: Cell?;
}

contract OptStructInVar {
    content: OptionalFields;

    init() {
        self.content = OptionalFields{
            foo: null,
            bar: null,
            baz: null,
            quux: null,
        };
    }
}
