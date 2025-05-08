contract DeepOptFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}