// Contract with many optional primitive fields without explicit default
contract ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Int?;
    opt5: Bool?;
    opt6: String?;

    init() {
        self.opt1 = 1;
        self.opt2 = true;
        self.opt3 = "x";
        self.opt4 = 4;
        self.opt5 = false;
        self.opt6 = "y";
    }

    receive() {}
}