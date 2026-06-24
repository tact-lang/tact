struct OptionalString {
    s: String?;
}

contract OptStrStructField {
    data: OptionalString;

    init() {
        self.data = OptionalString{ s: null };
    }
}
