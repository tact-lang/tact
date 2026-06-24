struct ComposeOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract ComposeOptionalFieldsContract {
    foo: Int;
    bar: ComposeOptionalFields;

    init() {
        self.foo = 42;
        self.bar = ComposeOptionalFields {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}
