struct Deeply {
    i: Int;
}

contract ManyNestedOptionals {
    opt1: Deeply?;
    opt2: Deeply?;
    opt3: Deeply?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
    }
}