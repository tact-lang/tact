struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStorage {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            foo: null,
            bar: true,
            baz: null
        };
    }
}