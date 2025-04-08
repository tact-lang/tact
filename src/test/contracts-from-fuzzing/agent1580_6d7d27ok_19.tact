contract InitDefaultsFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int?;
    e: Bool?;

    init() {
        self.d = null;
        self.e = null;
    }
}