struct HasOptionals {
    foo: Int?;
    bar: String?;
    baz: Cell?;
}

contract OptionalFields {
    optData: HasOptionals;

    init() {
        self.optData = HasOptionals{
            foo: null,
            bar: "hello",
            baz: null
        };
    }
}