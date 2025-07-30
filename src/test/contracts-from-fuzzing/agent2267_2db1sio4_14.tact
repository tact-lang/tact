contract DefaultOptionalInit {
    opt1: Int?;
    opt2: Int?;
    opt3: String?;

    init() {
        self.opt1 = null;
        self.opt2 = 5;
        self.opt3 = null;
    }
}
