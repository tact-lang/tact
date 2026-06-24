contract TestContract {
    opt1: Bool? = null;
    opt2: Int? = null;
    opt3: String? = null;
    opt4: Address? = null;

    init() {
        self.opt1 = true;
        self.opt2 = 5;
        self.opt3 = "x";
        self.opt4 = myAddress();
    }
}