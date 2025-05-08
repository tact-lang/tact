struct OptionalString {
    description: String?;
}

contract OptStringField {
    data: OptionalString;

    init() {
        self.data = OptionalString{ description: null };
    }
}