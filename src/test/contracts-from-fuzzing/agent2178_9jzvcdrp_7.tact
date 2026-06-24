struct Inner {
    number: Int;
    flag: Bool;
}

contract LargeListStorage {
    num1: Int;
    num2: Int;
    num3: Int;
    opt1: Int?;
    opt2: Bool?;
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;

    init() {
        self.num1 = 1;
        self.num2 = 2;
        self.num3 = 3;
        self.opt1 = null;
        self.opt2 = null;
        self.inner1 = Inner{ number: 10, flag: true };
        self.inner2 = Inner{ number: 20, flag: false };
        self.optInner = null;
    }
}