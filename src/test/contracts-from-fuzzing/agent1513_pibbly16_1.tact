contract Test {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;

    init() {
        self.d = null;
        self.e = true;
    }
}