contract LotsOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}