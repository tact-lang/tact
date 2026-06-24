contract LongStrings {
    a: String;
    b: String;

    init() {
        self.a = "This is a rather long string to store inside contract storage.";
        self.b = "Another long persistent storage string, testing limits.";
    }
}