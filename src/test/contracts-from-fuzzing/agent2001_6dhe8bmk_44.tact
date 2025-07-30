contract StringFields {
    a: String = "abc";
    b: String?;

    init() {
        self.b = null;
    }
}