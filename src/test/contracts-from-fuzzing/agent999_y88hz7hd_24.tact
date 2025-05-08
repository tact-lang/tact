contract StringEscapeTest {
    s1: String = "Hello\nWorld";
    s2: String = "Tab\tSeparated";
    s3: String = "Quote\"Test\"";

    init() {
        self.s1 = "Hello\nWorld";
        self.s2 = "Tab\tSeparated";
        self.s3 = "Quote\"Test\"";
    }
}