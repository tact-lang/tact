struct Inner {
    flag: Bool;
    val: Int?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ flag: true, val: 42 };
    }
}