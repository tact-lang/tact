struct A {
    f1: Int?;
}

contract OuterOptOpt {
    opt1: A?;
    opt2: A?;
    opt3: A?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
    }
}