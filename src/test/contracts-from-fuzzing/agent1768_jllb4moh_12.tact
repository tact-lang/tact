contract TestContract {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Int?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = "abc";
        self.opt4 = null;
        self.opt5 = 999;
    }

    receive() {
        self.opt1 = 1;
    }
}