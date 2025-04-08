// contract with multiple optional persistent fields of various types
contract Opts {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: String?;

    init() {
        self.opt1 = null;
        self.opt2 = true;
        self.opt3 = null;
        self.opt4 = emptyCell();
        self.opt5 = null;
    }
}
