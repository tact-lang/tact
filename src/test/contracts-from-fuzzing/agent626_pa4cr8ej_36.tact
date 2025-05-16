struct OptionalString {
    s: String?;
}

contract NullStringStart {
    data: OptionalString;

    init() {
        self.data = OptionalString{ s: null };
    }
}