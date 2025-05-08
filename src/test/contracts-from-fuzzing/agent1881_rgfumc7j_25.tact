contract StringDefaults {
    s1: String = "foo";
    s2: String = "";

    init() {
        self.s1 = "bar";
        self.s2 = "baz";
    }
}