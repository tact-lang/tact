struct Inner {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract ManyBools {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    inner: Inner;

    init() {
        self.f1 = true;
        self.f2 = false;
        self.f3 = true;
        self.inner = Inner{b1: false, b2: true, b3: false};
    }
}