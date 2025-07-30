contract MultipleOptionals {
    opt1: Bool?;
    opt2: String?;
    opt3: Int?;
    opt4: Address?;
    opt5: Cell?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
    }
}