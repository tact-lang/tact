struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    pos: Inner;
    count: Int;
    flag: Bool;

    init() {
        self.pos = Inner{ x: 1, y: 2 };
        self.count = 42;
        self.flag = true;
    }
}