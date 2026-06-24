struct WithOptionals {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    quux: String?;
}

contract OptionalStructFields {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            foo: null,
            bar: null,
            baz: null,
            quux: null,
        };
    }
}