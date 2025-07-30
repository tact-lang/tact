contract NestedNullDefaults {
    s1: String? = null;
    s2: String = "foo";
    s3: Int? = null;
    s4: Int = 42;
    init() {
        self.s1 = null;
        self.s2 = "bar";
        self.s3 = null;
        self.s4 = 100;
    }
}