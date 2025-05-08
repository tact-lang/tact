struct Inner {
    x: Int;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{ x: 7 };
    }
}