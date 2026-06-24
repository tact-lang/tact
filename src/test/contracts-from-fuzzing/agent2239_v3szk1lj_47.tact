contract InitDefaults {
    a: Int = 3;
    b: Bool?;
    c: String = "hi";

    init() {
        self.b = null;
    }
}