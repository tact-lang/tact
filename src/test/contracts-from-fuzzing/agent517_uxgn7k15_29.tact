contract OptionalsChain {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 1;
        self.a = null;
        self.b = true;
        self.b = null;
        self.c = null;
        self.c = "str";
    }
}