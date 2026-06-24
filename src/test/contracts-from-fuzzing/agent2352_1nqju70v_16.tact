contract DefaultsVsInit {
    opt1: Int? = 1;
    opt2: String? = "x";
    opt3: Bool?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = true;
    }
}