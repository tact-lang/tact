contract CrossOptional {
    opt1: Int?;
    opt2: Bool;
    opt3: String?;
    opt4: Bool?;
    init() {
        self.opt1 = 5;
        self.opt2 = true;
        self.opt3 = null;
        self.opt4 = null;
    }
}