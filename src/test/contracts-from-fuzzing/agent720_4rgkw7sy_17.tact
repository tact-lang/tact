struct A {
    a1: Int;
}

contract MultiOptional {
    opt1: A?;
    opt2: Int?;
    opt3: Bool?;
    opt4: String?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
    }
}