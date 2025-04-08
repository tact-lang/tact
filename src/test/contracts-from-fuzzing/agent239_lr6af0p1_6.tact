struct OptionalString {
    s: String?;
}

contract OptionalStringContract {
    data: OptionalString;

    init() {
        self.data = OptionalString{ s: null };
    }
}