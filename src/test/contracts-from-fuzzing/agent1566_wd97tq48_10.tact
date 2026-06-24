contract ManyOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Cell?;
    opt4: Bool?;
    opt5: Int?;
    opt6: String?;
    opt7: Cell?;
    opt8: Bool?;

    init() {
        self.opt1 = 1;
        self.opt2 = "2";
        self.opt3 = emptyCell();
        self.opt4 = true;
        self.opt5 = 5;
        self.opt6 = "6";
        self.opt7 = emptyCell();
        self.opt8 = false;
    }
}
