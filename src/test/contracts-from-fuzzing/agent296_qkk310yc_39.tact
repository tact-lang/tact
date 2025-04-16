contract OptionalStringDefaults {
    a: String? = null;
    b: String? = null;

    init() {
        self.a = "filled";
        self.b = null;
    }
}
