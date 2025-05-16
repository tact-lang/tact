contract InitDefaults {
    a: Int;
    b: Bool = false;
    c: String;
    d: String?;

    init() {
        self.a = 42;
        self.c = "abc";
        self.d = null;
    }
}
