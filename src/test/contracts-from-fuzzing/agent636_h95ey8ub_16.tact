struct OptionalString {
    s: String?;
}

contract OptionalStringField {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            s: "hello"
        };
    }
}