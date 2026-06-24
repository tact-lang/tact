struct Inner {
    x: Int;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    s: Inner;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = null;
        self.s = Inner{ x: 5 };
    }
}