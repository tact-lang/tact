struct Inner {
    flag: Bool;
}

contract Top {
    s1: Inner;
    s2: Inner?;

    init() {
        self.s1 = Inner{ flag: true };
        self.s2 = null;
    }
}