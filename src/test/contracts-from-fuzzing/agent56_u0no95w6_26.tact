contract PartialDefaults {
    a: Int;            // no default
    b: Bool = false;  // default

    init() {
        self.a = 123;
        self.b = true;
    }
}