contract NestedOptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String? = null;

    init() {
        self.a = null;
        self.b = null;
    }
}