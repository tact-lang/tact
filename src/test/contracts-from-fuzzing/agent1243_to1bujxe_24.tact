struct OptionalString {
    s: String?;
}

contract Test {
    val: OptionalString?;
    init() {
        self.val = null;
    }
}