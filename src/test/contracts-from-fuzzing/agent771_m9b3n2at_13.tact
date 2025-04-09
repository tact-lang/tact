contract LargeString {
    text: String;

    init() {
        self.text = "This is a long string to test persistent storage and serialization.";
    }
}