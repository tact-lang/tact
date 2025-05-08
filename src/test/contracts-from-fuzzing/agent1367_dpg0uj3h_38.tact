contract ComplexNullMix {
    a: Int?;
    b: Bool = false;
    c: Int = 1;
    d: String?;
    e: String = "hello";

    init() {
        self.a = null;
        self.d = null;
    }
}