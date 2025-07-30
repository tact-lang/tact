contract TestContract {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;

    init() {
        self.opt1 = 1;
        self.opt2 = false;
        self.opt3 = "abc";
        self.opt4 = myAddress();
    }
}