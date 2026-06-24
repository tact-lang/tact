contract OptionalStrings {
    title: String?;
    description: String?;

    init() {
        self.title = null;
        self.description = null;
    }
}