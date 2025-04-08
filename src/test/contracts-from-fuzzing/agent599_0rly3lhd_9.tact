struct OptionalString {
    text: String?;
}

contract TestContract {
    s: OptionalString;

    init() {
        self.s = OptionalString{ text: null };
    }
}