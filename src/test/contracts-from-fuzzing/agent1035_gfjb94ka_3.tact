struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: Inner = Inner{ x: 1, y: true };
    init() {
        self.s = Inner{ x: 2, y: false };
    }
    receive() {}
}