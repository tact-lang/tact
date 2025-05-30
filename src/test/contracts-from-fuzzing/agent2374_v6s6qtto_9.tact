contract OptionalFields {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Cell?;
    f6: Slice?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = "ok";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
    }
}