contract InitDefaults {
    a: Int = 1;
    b: String = "abc";
    c: Bool?;

    init() {
        self.c = true;
    }
}