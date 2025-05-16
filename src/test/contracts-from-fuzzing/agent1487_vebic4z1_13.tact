contract DefaultStrings {
    s1: String = "hello";
    s2: String = "";
    s3: String = "abc";

    init() {
        self.s1 = "world";
        self.s2 = "!";
        self.s3 = "xyz";
    }
}