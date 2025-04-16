contract ManyOptionalFields {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
    }
}
