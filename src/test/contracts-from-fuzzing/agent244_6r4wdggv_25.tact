struct OptionalString {
    s: String?;
}

contract OptStringStorage {
    val: OptionalString;

    init() {
        self.val = OptionalString{ s: null };
    }
}