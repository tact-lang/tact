struct OptionalString {
    s: String?;
}

contract OptStringField {
    f: OptionalString;

    init() {
        self.f = OptionalString{ s: "hello" };
    }
}