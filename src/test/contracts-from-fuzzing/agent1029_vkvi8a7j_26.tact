struct OptionalString {
    optText: String?;
}

contract OptionalStringContract {
    s: OptionalString;
    init() {
        self.s = OptionalString{ optText: null };
    }
}