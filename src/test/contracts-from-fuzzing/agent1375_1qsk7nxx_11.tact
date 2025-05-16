contract OptsDefaults {
    a: Int?;
    b: Bool? = null;
    c: String? = null;
    d: Address?;

    init() {
        self.a = null;
        self.d = null;
    }
}