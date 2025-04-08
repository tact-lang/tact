contract TestContract {
    s1: String = "Hello";
    s2: String = "World";
    s3: String = "!";

    init() {
        self.s1 = "A";
        self.s2 = "B";
        self.s3 = "C";
    }
}
