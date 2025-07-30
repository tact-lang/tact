struct InnerS {
    a: Int;
    b: Bool;
}

contract Test28 {
    s: InnerS?;
    flag: Bool;

    init() {
        self.s = null;
        self.flag = true;
    }
}
