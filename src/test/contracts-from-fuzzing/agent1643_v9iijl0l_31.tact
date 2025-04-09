struct OptionInMiddle {
    a: Int;
    b: Int?;
    c: Int;
}

contract OptionInMiddleContract {
    s: OptionInMiddle;

    init() {
        self.s = OptionInMiddle{ a:1, b:null, c:2 };
    }
}
