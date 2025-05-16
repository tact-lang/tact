contract OptionalStringDefault {
    a: String? = null;

    init() {
        self.a = "changed";
    }
}