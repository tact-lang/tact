struct Inner {
    a: Int;
    b: Bool?;
}

contract TestContract {
    data: Inner;
    flag: Bool;

    init() {
        self.data = Inner{ a: 1, b: true };
        self.flag = false;
    }
}