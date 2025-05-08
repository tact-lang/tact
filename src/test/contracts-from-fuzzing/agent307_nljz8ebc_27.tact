struct OptionalS {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptStruct {
    field: OptionalS;

    init() {
        self.field = OptionalS{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}