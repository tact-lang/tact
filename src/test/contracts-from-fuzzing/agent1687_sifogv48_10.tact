contract Test {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: String?;

    init() {
        self.d = null;
        self.e = "def";
    }
}