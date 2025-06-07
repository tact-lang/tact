contract PartialDefaults {
    a: Int = 42;
    b: Bool;
    c: String = "str";

    init() {
        self.b = true;
    }
}