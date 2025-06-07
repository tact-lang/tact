struct OptionalString {
    s: String?;
}

contract OptionalStringField {
    v: OptionalString;

    init() {
        self.v = OptionalString{ s: null };
    }
}