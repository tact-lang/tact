contract TopLevelDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;

    init() {
        self.d = 42;
        self.e = true;
    }
}