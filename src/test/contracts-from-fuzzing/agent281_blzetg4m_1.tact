struct SingleOptional {
    foo: Int?;
    bar: Bool?;
}

contract OptionalFields {
    optvals: SingleOptional;

    init() {
        self.optvals = SingleOptional{ foo: null, bar: null };
    }
}