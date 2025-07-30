contract ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Int?;
    opt5: Bool?;
    opt6: String?;

    init() {
        self.opt1 = null;
        self.opt2 = false;
        self.opt3 = "hey";
        self.opt4 = 123;
        self.opt5 = null;
        self.opt6 = null;
    }
}