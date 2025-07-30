struct Inner {
    num: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ num: 10 };
    }
}