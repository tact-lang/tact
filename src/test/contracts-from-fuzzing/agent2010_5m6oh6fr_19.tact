contract OptCombo {
    n: Int?;
    s: String?;
    b: Bool?;
    a: Address?;

    init() {
        self.n = null;
        self.s = "hi";
        self.b = false;
        self.a = myAddress();
    }
}