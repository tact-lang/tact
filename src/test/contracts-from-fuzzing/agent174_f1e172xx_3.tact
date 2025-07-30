struct OptionalFields {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    storage: OptionalFields;

    init() {
        self.storage = OptionalFields{ foo: null, bar: true };
    }
}