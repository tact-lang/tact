struct OptionalString {
    s: String?;
}

contract OptStringStorage {
    field: OptionalString;

    init() {
        self.field = OptionalString{s: null};
    }
}