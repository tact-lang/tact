struct Inner {
    count: Int;
    flag: Bool;
}

contract TestContract {
    num: Int = 1;
    info: Inner;

    init() {
        self.info = Inner{ count: 42, flag: true };
    }
}