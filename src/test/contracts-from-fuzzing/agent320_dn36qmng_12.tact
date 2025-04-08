contract OptFields {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;

    init() {
        self.opt1 = null;
        self.opt2 = "str";
        self.opt3 = true;
    }
}