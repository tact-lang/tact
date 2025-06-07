// Multiple optionals of primitive types
contract ManyOptionals {
    opt1: Int?;
    opt2: Int?;
    opt3: Bool?;
    opt4: String?;

    init() {
        self.opt1 = null;
        self.opt2 = 5;
        self.opt3 = true;
        self.opt4 = null;
    }
}