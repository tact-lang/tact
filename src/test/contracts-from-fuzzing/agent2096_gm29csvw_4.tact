contract LargeOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: Int?;
    opt4: Bool?;
    opt5: Int?;
    opt6: Bool?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = 42;
        self.opt4 = true;
        self.opt5 = null;
        self.opt6 = false;
    }
}