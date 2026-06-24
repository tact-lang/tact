contract TestContract {
    s: String = "";
    s2: String = "abc";
    s3: String = "def";

    init() {
        self.s = "hello";
        self.s2 = "world";
        self.s3 = "!";
    }
}