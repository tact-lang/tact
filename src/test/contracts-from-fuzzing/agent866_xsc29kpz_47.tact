struct HasStrings {
    a: String;
    b: String;
}

contract TwoStrs {
    info: HasStrings;
    init() {
        self.info = HasStrings { a:"foo", b:"bar" };
    }
}