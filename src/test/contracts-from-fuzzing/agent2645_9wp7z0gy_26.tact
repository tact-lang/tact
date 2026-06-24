contract OptionalString {
    s: String?;

    init() {
        self.s = null;
        self.s = "abc";
    }
}
