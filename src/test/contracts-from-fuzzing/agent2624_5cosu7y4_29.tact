contract OptionalStringDefault {
    a: String? = null;
    b: String? = "hi";

    init() {
        self.a = "world";
        self.b = null;
    }
}
