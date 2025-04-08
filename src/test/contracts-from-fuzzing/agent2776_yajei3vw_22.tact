struct OptionalString {
    val: String?;
}

contract InlineOptString {
    s: OptionalString;

    init() {
        self.s = OptionalString{};
    }
}
