struct OptionalInOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFields {
    opt: OptionalInOptional?;

    init() {
        self.opt = null;
    }
}