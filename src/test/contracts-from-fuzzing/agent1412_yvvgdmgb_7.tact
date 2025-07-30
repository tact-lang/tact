contract StringFields {
    s1: String;
    s2: String?;

    init() {
        self.s1 = "Hello, world!";
        self.s2 = null;
    }
}