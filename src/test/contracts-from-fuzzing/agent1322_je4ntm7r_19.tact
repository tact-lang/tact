struct OptionalString {
    maybeText: String?;
}

contract TestOptionalString {
    data: OptionalString;

    init() {
        self.data = OptionalString{ maybeText: null };
    }
}