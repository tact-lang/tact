struct Inner {
    i1: Int;
    i2: Bool;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ i1: 1, i2: true };
    }
}