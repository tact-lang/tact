contract OptionalStringsFields {
    u: String?;
    v: String?;
    w: String?;

    init() {
        self.u = "foo";
        self.v = null;
        self.w = "bar";
    }
}