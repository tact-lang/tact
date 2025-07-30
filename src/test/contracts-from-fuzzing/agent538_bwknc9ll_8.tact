struct OptNestedStruct {
    inn: Int?;
}

contract ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: OptNestedStruct?;
    opt4: String?;

    init() {
        self.opt1 = 1;
        self.opt2 = true;
        self.opt3 = null;
        self.opt4 = null;
    }
}
