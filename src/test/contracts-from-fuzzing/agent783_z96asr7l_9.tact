contract OptionalStringFields {
    title: String?;
    subtitle: String?;
    description: String?;

    init() {
        self.title = "Big";
        self.subtitle = null;
        self.description = "Test case";
    }
}