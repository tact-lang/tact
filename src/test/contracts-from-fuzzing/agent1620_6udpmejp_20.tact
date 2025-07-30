contract MultipleOptionalsDefaults {
    a: Int? = null;
    b: Bool? = false;
    c: String? = "zz";
    d: Int = 5;

    init() {
        self.d = 10;
    }
}