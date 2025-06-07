contract OptionalMix {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
    opt6: Slice?;

    init() {
        self.opt1 = 5;
        self.opt2 = null;
        self.opt3 = "hello";
        self.opt4 = null;
        self.opt5 = emptyCell();
        self.opt6 = null;
    }
}