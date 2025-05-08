struct Inner {
    x: Int;
}

contract DefaultWithPartial {
    s: Inner = Inner{ x: 7 };
    num: Int;

    init() {
        self.num = self.s.x + 3;
    }
}