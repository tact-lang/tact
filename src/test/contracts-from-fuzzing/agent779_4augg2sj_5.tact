struct OptionalNested {
    optVal: Int?;
    optStr: String?;
}

contract OptFields {
    foo: OptionalNested;

    init() {
        self.foo = OptionalNested{
            optVal: null,
            optStr: null
        };
    }
}