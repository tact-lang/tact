contract OnlyOptionals {
    opt1: Int? = null;
    opt2: Bool? = null;
    opt3: Address? = null;
    opt4: Cell? = null;
    opt5: Slice? = null;
    opt6: String? = null;

    init() {
        self.opt1 = 0;
        self.opt2 = true;
        self.opt3 = myAddress();
        self.opt4 = emptyCell();
        self.opt5 = emptyCell().asSlice();
        self.opt6 = "hi";
    }
}