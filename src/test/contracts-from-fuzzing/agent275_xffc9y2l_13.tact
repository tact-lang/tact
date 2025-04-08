struct OptionalString {
    val: String?;
}

contract OptStringField {
    data: OptionalString;

    init() {
        self.data = OptionalString{ val: null };
    }
}