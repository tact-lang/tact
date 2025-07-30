struct OptionalString {
    s: String?;
}

contract OptStringField {
    os: OptionalString;

    init() {
        self.os = OptionalString {
            s: "hi"
        };
    }
}