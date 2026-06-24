contract ComplexDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int?;
    d: String = "hi";
    e: String?;

    init() {
        self.c = null;
        self.e = null;
    }
}