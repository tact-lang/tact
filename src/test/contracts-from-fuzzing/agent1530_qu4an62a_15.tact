contract LongStrings {
    s1: String;
    s2: String;

    init() {
        self.s1 = "This is a relatively long string field within persistent storage.";
        self.s2 = "Another long string to test complexities in serialization or storage layout.";
    }
}