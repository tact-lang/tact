contract OnlyStrings {
    s1: String;
    s2: String?;
    s3: String = "foo";
    s4: String? = null;
    init() {
        self.s1 = "bar";
        self.s2 = "baz";
    }
}