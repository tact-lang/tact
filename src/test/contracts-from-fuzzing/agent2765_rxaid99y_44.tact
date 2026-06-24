contract OptionalString {
    v: String?;
    init() {
        self.v = null;
        self.v = "hi";
        self.v = null;
    }
}