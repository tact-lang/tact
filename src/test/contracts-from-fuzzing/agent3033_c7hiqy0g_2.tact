struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    point: Inner;

    init() {
        self.point = Inner{ a: 7, b: false };
    }
}
