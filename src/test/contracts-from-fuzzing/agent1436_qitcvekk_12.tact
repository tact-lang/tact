contract TestStringsOptional {
    s1: String? = null;
    s2: String = "hi";
    s3: String?;
    s4: String? = "hello";

    init() {
        self.s3 = "assigned";
        self.s4 = null;
    }
}