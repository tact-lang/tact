contract BigOptionalFields {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: String?;
    opt5: Cell?;
    opt6: Slice?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
        self.opt6 = null;
    }
}
