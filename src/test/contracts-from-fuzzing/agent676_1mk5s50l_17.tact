contract InitDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: String = "default";

    init() {
        self.b = null;
    }
}