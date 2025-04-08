struct Inner {
    flag: Bool;
}

contract OptionalStructChange {
    s: Inner?;

    init() {
        self.s = null;
        self.s = Inner{ flag: true };
    }
}