contract ManyOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Address?;
    opt5: Slice?;
    opt6: Cell?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
        self.opt6 = null;
    }

    receive() {}
}