contract InitDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;

    init() {
        self.d = null;
    }
}
