struct OptStr {
    text: String?;
}

contract OptionalOnly {
    field: OptStr;

    init() {
        self.field = OptStr{ text: null };
    }
}