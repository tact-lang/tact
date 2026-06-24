contract InitPartialDefaults {
    a: Int = 1;
    b: Int; // no default
    c: Int = 3;

    init() {
        self.b = 2;
    }
}