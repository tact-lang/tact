contract VariantDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "abc";
    d: Bool;

    init() {
        self.b = true;
        self.d = false;
    }
}