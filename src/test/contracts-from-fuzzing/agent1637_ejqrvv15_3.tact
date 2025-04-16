struct OptFields {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract OptionalStructFields {
    optionalData: OptFields;

    init() {
        self.optionalData = OptFields{
            foo: null,
            bar: true,
            text: "hello",
        };
    }
}