struct Boo {
    flag: Bool;
    optFlag: Bool?;
}

contract BoolComboFields {
    b1: Bool;
    b2: Bool?;
    s: Boo;

    init() {
        self.b1 = true;
        self.b2 = null;
        self.s = Boo{ flag: false, optFlag: null };
    }
}