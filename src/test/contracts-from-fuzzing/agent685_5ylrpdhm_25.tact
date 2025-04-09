struct OptionalString {
    s: String?;
}

contract WithOptionalString {
    data: OptionalString;

    init() {
        self.data = OptionalString{ s: null };
    }
}