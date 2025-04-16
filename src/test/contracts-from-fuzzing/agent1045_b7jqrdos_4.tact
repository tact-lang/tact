contract TestContract {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;

    init() {
        self.opt1 = null;
        self.opt2 = true;
        self.opt3 = null;
    }

    receive() {
        self.opt1 = 5;
        self.opt2 = false;
        self.opt3 = null;
    }
}