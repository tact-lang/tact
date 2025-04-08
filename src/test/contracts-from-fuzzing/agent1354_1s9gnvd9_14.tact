contract LargeOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Int?;
    opt5: Bool?;
    opt6: String?;

    init() {
        self.opt1 = 1;
        self.opt2 = null;
        self.opt3 = "hi";
        self.opt4 = null;
        self.opt5 = true;
        self.opt6 = null;
    }
}