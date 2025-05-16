contract InitDefaults {
    a: Int = 4;
    b: Bool = true;
    s: String = "hi";

    init() {
        self.a = 42;
    }
}