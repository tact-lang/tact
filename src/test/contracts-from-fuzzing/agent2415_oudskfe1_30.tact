contract OptionalAtTop {
    opt1: Int?;
    opt2: String?;

    init() {
        self.opt1 = null;
        self.opt2 = "hey";
    }
}