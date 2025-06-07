struct OptionalString {
    s: String?;
}

contract OptionalStringField {
    val: OptionalString;

    init() {
        self.val = OptionalString{};
    }

    receive() {
        self.val = OptionalString{ s: "hello!" };
    }
}