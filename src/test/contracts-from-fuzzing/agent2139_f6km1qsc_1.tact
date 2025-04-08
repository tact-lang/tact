struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    point: Inner;
    flag: Bool;

    init() {
        self.point = Inner{ x: 1, y: null };
        self.flag = true;
    }
}