contract TestContract {
    opt1: Bool?;
    opt2: Int?;
    opt3: Slice?;
    opt4: Cell?;
    opt5: Address?;

    init() {
        self.opt1 = true;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
    }
}