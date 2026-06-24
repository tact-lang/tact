contract StringFields {
    s1: String = "hello";
    s2: String = "world";
    s3: String? = null;

    init() {
        self.s1 = "foo";
        self.s2 = "bar";
        self.s3 = null;
    }
}