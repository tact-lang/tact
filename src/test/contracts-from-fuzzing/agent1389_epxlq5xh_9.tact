struct OptionalStringWrapper {
    s: String?;
}

contract OptionalStringField {
    field: OptionalStringWrapper;

    init() {
        self.field = OptionalStringWrapper{
            s: "hello"
        };
    }
}