contract ManyOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Address?;
    opt5: Cell?;
    opt6: Slice?;
    opt7: Builder?;

    init() {
        self.opt1 = 1;
        self.opt2 = "hello";
        self.opt3 = true;
        self.opt4 = myAddress();
        self.opt5 = emptyCell();
        self.opt6 = self.opt5.asSlice();
        self.opt7 = beginCell();
    }
}