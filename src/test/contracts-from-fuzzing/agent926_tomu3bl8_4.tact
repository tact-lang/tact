struct OptionalNested {
    foo: Bool?;
    bar: String?;
    baz: Int?;
}

contract TestContract {
    optionals: OptionalNested;

    init() {
        self.optionals = OptionalNested{
            foo: null,
            bar: "hello",
            baz: 123,
        };
    }
}