contract MultiOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Slice?;
    opt5: String?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
    }
}