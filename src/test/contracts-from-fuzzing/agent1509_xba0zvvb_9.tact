contract OptionTest {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: String?;

    init() {
        self.opt1 = 123;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = "hi";
    }

    receive() {
        if (self.opt2 == null) {
            self.opt2 = true;
        }
    }
}