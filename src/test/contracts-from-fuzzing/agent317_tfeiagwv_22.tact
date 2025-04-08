contract LongChain {
    f0: Int;
    f1: Bool;
    f2: Int?;
    f3: Bool?;
    f4: String;
    f5: String?;
    f6: Address;
    f7: Address?;
    f8: Cell;
    f9: Cell?;

    init() {
        self.f0 = 0;
        self.f1 = true;
        self.f2 = null;
        self.f3 = null;
        self.f4 = "string";
        self.f5 = null;
        self.f6 = myAddress();
        self.f7 = null;
        self.f8 = emptyCell();
        self.f9 = null;
    }
}