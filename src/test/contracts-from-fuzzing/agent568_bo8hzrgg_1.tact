struct Inner {
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ flag: true, count: 42 };
    }
}