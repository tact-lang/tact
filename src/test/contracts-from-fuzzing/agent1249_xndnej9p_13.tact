struct S {
    intField: Int;
}

contract LargeOptionalList {
    opt1: S?;
    opt2: S?;
    opt3: S?;
    opt4: S?;
    opt5: S?;
    opt6: S?;
    opt7: S?;
    opt8: S?;
    opt9: S?;
    opt10: S?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
        self.opt6 = null;
        self.opt7 = null;
        self.opt8 = null;
        self.opt9 = null;
        self.opt10 = null;
    }
}