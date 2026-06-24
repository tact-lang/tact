struct Inner {
    flag: Bool;
    number: Int?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ flag: true, number: null };
    }
}