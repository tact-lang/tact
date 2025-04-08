// Persistent variable with string optional initialized to null
contract OptionalStringPersistent {
    s: String?;

    init() {
        self.s = null;
    }
}
