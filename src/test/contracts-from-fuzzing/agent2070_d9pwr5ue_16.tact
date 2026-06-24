contract LargeStrings {
    s1: String;
    s2: String;

    init() {
        self.s1 = "This is a long string for testing persistent storage fields.";
        self.s2 = "Another long string to ensure multiple string fields work properly.";
    }
}