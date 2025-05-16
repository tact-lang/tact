contract DeepOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Cell?;
    opt5: Address?;
    opt6: Slice?;

    init() {
        self.opt1 = 1;
        self.opt2 = "text";
        self.opt3 = false;
        self.opt4 = emptyCell();
        self.opt5 = myAddress();
        self.opt6 = emptyCell().asSlice();
    }
}