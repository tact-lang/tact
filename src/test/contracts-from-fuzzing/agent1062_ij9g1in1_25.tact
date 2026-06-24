contract OptionalString {
    text: String?;
    count: Int;

    init() {
        self.text = null;
        self.count = 5;
    }
}