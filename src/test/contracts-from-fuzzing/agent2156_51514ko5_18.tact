struct OptionalString {
    s: String?;
}

contract OptionalStructField {
    value: OptionalString;
    init() {
        self.value = OptionalString{s: null};
    }
}