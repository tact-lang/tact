contract PartialDefaults {
    a: Int;
    b: Bool = true;
    c: Int?;
    d: String = "x";

    init() {
        self.a = 7;
        self.c = null;
    }
}
