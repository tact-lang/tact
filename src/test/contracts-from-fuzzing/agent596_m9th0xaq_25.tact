struct OptionalString {
    name: String?;
}

contract OptString {
    val: OptionalString;

    init() {
        self.val = OptionalString{ name: null };
    }
}