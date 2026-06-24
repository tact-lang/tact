contract DefaultValues {
    a: Int = 7;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;

    init() {
        self.d = null;
        self.e = false;
    }
}
