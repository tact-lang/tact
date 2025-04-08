struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Inner;
    flag: Bool;
    count: Int;

    init() {
        self.flag = false;
        self.count = 0;
        self.data = Inner{ a: 1, b: true };
    }
}