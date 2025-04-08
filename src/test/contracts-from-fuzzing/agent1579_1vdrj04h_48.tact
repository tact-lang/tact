struct Inner {
    flag: Bool;
}

contract InnerTwice {
    f1: Inner;
    f2: Inner;
    init() {
        self.f1 = Inner{ flag: true };
        self.f2 = Inner{ flag: false };
    }
}