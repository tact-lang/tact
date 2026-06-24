contract OptionalStorage {
    opt1: Int?;
    opt2: Bool?;
    opt3: Cell?;
    opt4: String?;

    init() {
        self.opt1 = 1;
        self.opt2 = null;
        self.opt3 = emptyCell();
        self.opt4 = null;
    }
}