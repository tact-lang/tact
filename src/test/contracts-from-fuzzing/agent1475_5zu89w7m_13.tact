contract NestedOpt {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Address?;
    opt5: Cell?;
    
    init() {
        self.opt1 = 11;
        self.opt2 = "hello";
        self.opt3 = true;
        self.opt4 = myAddress();
        self.opt5 = emptyCell();
    }
}