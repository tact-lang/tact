struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    pos: Inner;
    flag: Bool;
    count: Int;
    init() {
        self.pos = Inner{ x: 1, y: true };
        self.flag = false;
        self.count = 0;
    }
}