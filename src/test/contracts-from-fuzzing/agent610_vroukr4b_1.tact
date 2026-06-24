struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    point: Inner;
    flag: Bool;

    init() {
        self.point = Inner{ a: 1, b: true };
        self.flag = false;
    }
}
